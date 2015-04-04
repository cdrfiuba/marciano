/*

  main.c

  Copyright 2010-2011 Matthew T. Pandina. All rights reserved.

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:

  1. Redistributions of source code must retain the above copyright notice,
  this list of conditions and the following disclaimer.

  2. Redistributions in binary form must reproduce the above copyright notice,
  this list of conditions and the following disclaimer in the documentation
  and/or other materials provided with the distribution.

  THIS SOFTWARE IS PROVIDED BY MATTHEW T. PANDINA "AS IS" AND ANY EXPRESS OR
  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
  EVENT SHALL MATTHEW T. PANDINA OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
  INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
  EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

*/

#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <png.h>
#include <math.h>

// The following options can be set from the command line

// if true, instead of the LEDs being arranged sequentially, they are
// arranged in two halves with all of the even numbered outputs first,
// followed by all of the odd numbered outputs. This makes it easier to
// fit them next to each other on a breadboard.
bool breadboardMode = false;

// number of TLC5940 chips that are connected together in series
uint8_t TLC5940_N = 1;

// number of PWM bits used to define a single PWM cycle
// See ../firmware/Makefile for more details
uint8_t TLC5940_PWM_BITS = 12;

void printUsage(void) {
  fprintf(stderr, "\n"
          "NAME:\n"
          "\tpng2tlc - convert a PNG file into TLC5940-native "
          "source code\n"
          "\n"
          "SYNOPSIS:\n"
          "\tpng2tlc [-h] [-b] [-n TLC5940_N] [-p TLC5940_PWM_BITS] <pngfile>\n"
          "\n"
          "DESCRIPTION:\n"
          "\tThis program is designed to convert a PNG file (with or "
          "without an\n\talpha channel) into a C source code file that, "
          "when linked with the\n\tproper firmware, stores the data from "
          "the PNG file in an ATmega328P's\n\tflash RAM in the exact "
          "format that a TLC5940 expects it.\n"
          "\n"
          "\tTypically the output of this program is redirected into a "
          "file called\n\t`data.c` in the firmware directory.\n"
          "\n"
          "OPTIONS:\n"
          "  -h\n"
          "\tDisplay this help and exit.\n"
          "\n"
          "  -b\n"
          "\tBreadboard mode. Instead of the LEDs being arranged "
          "sequentially, they\n\tare arranged in two halves with all "
          "of the even numbered outputs first,\n\tfollowed by all of the "
          "odd numbered outputs. This makes it easier to\n\tfit them next "
          "to each other on a breadboard.\n"
          "\n"
          "\tDefault: %s\n"
          "\n"
          "  -n TLC5940_N\n"
          "\tNumber of TLC5940 chips that are connected together in "
          "series.\n"
          "\n"
          "\tDefault: %d\n"
          "\n"
          "  -p TLC5940_PWM_BITS\n"
          "\tNumber of PWM bits used to define a single PWM cycle.\n"
          "\n"
          "\tDefault: %d\n"
          "\n"
          "  <pngfile>\n"
          "\tPath to the PNG file to be converted into C source code.\n"
          "\n"
          , breadboardMode ? "TRUE" : "FALSE", TLC5940_N, TLC5940_PWM_BITS);
}

int parseArguments(int *argc, char ***argv) {
  int c;
  bool error, help;
  error = help = false;
  while (!error && (c = getopt(*argc, *argv, "hbn:p:")) != -1) {
    switch (c) {
    case 'h': // display help
      error = help = true;
      break;
    case 'b': // breadboard mode
      breadboardMode = true;
      break;
    case 'n': // TLC5940_N
      {
        uint8_t tmp = (uint8_t)atoi(optarg);
        if (tmp < 1) {
          fprintf(stderr, "\nError: TLC5940_N must be >= 1\n");
          error = true;
        } else {
          TLC5940_N = tmp;
        }
      }
      break;
    case 'p': // TLC5940_PWM_BITS
      {
        uint8_t tmp = (uint8_t)atoi(optarg);
        if (tmp < 8 || tmp > 12) {
          fprintf(stderr,
                  "\nError: TLC5940_PWM_BITS must be 8, 9, 10, 11, or 12\n");
          error = true;
        } else {
          TLC5940_PWM_BITS = tmp;
        }
      }
      break;
    default:
      error = true;
      break;
    }
  }

  if (help) {
    printUsage();
    return -1;
  }

  // test for missing pngfile
  if (optind >= *argc) {
    fprintf(stderr, "\nError: <pngfile> must be specified\n");
    error = true;
  }

  // test for extraneous arguments
  if (optind + 1 < *argc) {
    fprintf(stderr, "\nError: too many arguments\n");
    error = true;
  }

  // test for errors and print usage
  if (error) {
    printUsage();
    return -1;
  }

  return 0;
}

// ----- TLC5940 Stuff
#define TLC5940_MULTIPLEX_N 3
#define gsData_t uint16_t
#define channel_t uint16_t
#define channel3_t uint16_t

gsData_t gsDataSize;
channel_t numChannels;

// maps a linear 8-bit value to a 12-bit gamma corrected value
uint16_t TLC5940_GammaCorrect[256];

void TLC5940_SetGS(uint8_t gsData[][TLC5940_MULTIPLEX_N], uint8_t row,
                   channel_t channel, uint16_t value) {
  channel = numChannels - 1 - channel;
  channel3_t i = (channel3_t)channel * 3 / 2;

  switch (channel % 2) {
  case 0:
    gsData[i][row] = (value >> 4);
    i++;
    gsData[i][row] = (gsData[i][row] & 0x0F) | (uint8_t)(value << 4);
    break;
  default: // case 1:
    gsData[i][row] = (gsData[i][row] & 0xF0) | (value >> 8);
    i++;
    gsData[i][row] = (uint8_t)value;
    break;
  }
}

void TLC5940_SetAllGS(uint8_t gsData[][TLC5940_MULTIPLEX_N], uint8_t row,
                      uint16_t value) {
  uint8_t tmp1 = (value >> 4);
  uint8_t tmp2 = (uint8_t)(value << 4) | (tmp1 >> 4);
  gsData_t i = 0;
  do {
    gsData[i++][row] = tmp1;              // bits: 11 10 09 08 07 06 05 04
    gsData[i++][row] = tmp2;              // bits: 03 02 01 00 11 10 09 08
    gsData[i++][row] = (uint8_t)value;    // bits: 07 06 05 04 03 02 01 00
  } while (i < gsDataSize);
}
// ----- End TLC5940 Stuff


int main(int argc, char *argv[]) {
  // parse command line arguments, and possibly print usage
  int retVal = parseArguments(&argc, &argv);
  if (retVal != 0)
    return retVal;

  // Build gamma correction table
  for (uint16_t i = 0; i < 256; i++)
    TLC5940_GammaCorrect[i] = (uint16_t)(pow((double)i / 255.0, 2.5) *
                                         ((double)(1 << TLC5940_PWM_BITS) - 1) +
                                         0.5);

  // decode PNG file
  FILE *fp = fopen(argv[optind], "rb");
  if (!fp) {
    fprintf(stderr, "Unable to open '%s'\n", argv[optind]);
    return -1;
  }

  unsigned char header[8]; // NUM_SIG_BYTES = 8
  fread(header, 1, sizeof(header), fp);
  if (png_sig_cmp(header, 0, sizeof(header))) {
    fprintf(stderr, "'%s' is not a png file\n", argv[optind]);
    fclose(fp);
    return -1;
  }

  png_structp png_ptr = png_create_read_struct(PNG_LIBPNG_VER_STRING,
                                   (png_voidp)NULL, NULL, NULL);
  if (!png_ptr) {
    fprintf(stderr, "png_create_read_struct() failed\n");
    fclose(fp);
    return -1;
  }

  png_infop info_ptr = png_create_info_struct(png_ptr);
  if (!info_ptr) {
    fprintf(stderr, "png_create_info_struct() failed\n");
    png_destroy_read_struct(&png_ptr, (png_infopp)NULL, (png_infopp)NULL);
    fclose(fp);
    return -1;
  }

  png_infop end_info = png_create_info_struct(png_ptr);
  if (!end_info) {
    fprintf(stderr, "png_create_info_struct() failed\n");
    png_destroy_read_struct(&png_ptr, &info_ptr, (png_infopp)NULL);
    fclose(fp);
    return -1;
  }

  if (setjmp(png_jmpbuf(png_ptr))) {
    fprintf(stderr, "longjmp() called\n");
    png_destroy_read_struct(&png_ptr, &info_ptr, &end_info);
    fclose(fp);
    return -1;
  }

  png_init_io(png_ptr, fp);
  png_set_sig_bytes(png_ptr, sizeof(header));
  png_read_info(png_ptr, info_ptr);

  png_uint_32 width, height;
  int bit_depth, color_type, interlace_method, compression_method,
    filter_method;
  png_get_IHDR(png_ptr, info_ptr, &width, &height, &bit_depth, &color_type,
               &interlace_method, &compression_method, &filter_method);

  /* do any transformations necessary here */
  if (color_type == PNG_COLOR_TYPE_PALETTE)
    png_set_palette_to_rgb(png_ptr);

  if (color_type == PNG_COLOR_TYPE_GRAY && bit_depth < 8)
    png_set_expand_gray_1_2_4_to_8(png_ptr);

  if (png_get_valid(png_ptr, info_ptr, PNG_INFO_tRNS))
    png_set_tRNS_to_alpha(png_ptr);

  if (bit_depth == 16)
    png_set_strip_16(png_ptr);

  png_color_16 black_bg = {0, 0, 0, 0, 0};
  png_set_background(png_ptr, &black_bg, PNG_BACKGROUND_GAMMA_SCREEN, 0, 1);

  png_read_update_info(png_ptr, info_ptr);
  /* end transformations */

  png_uint_32 rowbytes = png_get_rowbytes(png_ptr, info_ptr);
  png_uint_32 pixel_size = rowbytes / width;

  if (height > PNG_UINT_32_MAX / png_sizeof(png_byte))
    png_error(png_ptr, "Image is too tall to process in memory");
  if (width > PNG_UINT_32_MAX / pixel_size)
    png_error(png_ptr, "Image is too wide to process in memory");

  png_bytep data = png_malloc(png_ptr, height * rowbytes);
  png_bytepp row_pointers = png_malloc(png_ptr, height * png_sizeof(png_bytep));

  for (png_uint_32 i = 0; i < height; ++i)
    row_pointers[i] = &data[i * rowbytes];

  png_set_rows(png_ptr, info_ptr, row_pointers);
  png_read_image(png_ptr, row_pointers);

  // data now contains the byte data in the format RGB

  // these have to get defined at runtime now
  gsDataSize = 24 * TLC5940_N;
  numChannels = 16 * TLC5940_N;

  // hooray for C99 variable length arrays!
  uint8_t gsData[gsDataSize][TLC5940_MULTIPLEX_N];
  uint8_t led[numChannels];

  int errorVal = 0;
  if (height > numChannels) {
    fprintf(stderr, "\n"
            "Error: Image is too tall for TLC5940_N = %d\n", TLC5940_N);
    printUsage();
    errorVal = -1;
    goto cleanup;
  }

  // create the mapping for TLC5940 outputs --> actual LED order
  if (breadboardMode) {
    for (channel_t i = 0; i < numChannels; i++) {
      if (i % 2)
        led[numChannels / 2 + i / 2] = i;
      else
        led[i / 2] = i;
    }
  } else {
    for (channel_t i = 0; i < numChannels; i++)
      led[i] = i;
  }

  // show arguments that were specified (stderr will not get redirected)
  fprintf(stderr,
          "The following options were used:\n"
          "\tTLC5940_N = %d\n"
          "\tTLC5940_PWM_BITS = %d\n"
          "\tBreadboard mode = %s\n"
          "\n"
          , TLC5940_N, TLC5940_PWM_BITS, breadboardMode ? "TRUE" : "FALSE");

  // start printing out the C source code
  printf("#include \"data.h\"\n\n");
  printf("uint16_t pov_width = %u;\n", (unsigned int)width);
  printf("uint16_t pov_height = %u;\n\n", (unsigned int)height);
  printf("uint8_t pov[][3][%d] PROGMEM = {\n", gsDataSize);
  for (uint8_t w = 0; w < width; w++) {
    for (uint8_t i = 0; i < TLC5940_MULTIPLEX_N; i++)
      TLC5940_SetAllGS(gsData, i, 0);
    for (uint8_t h = 0; h < height; h++)
      for (uint8_t i = 0; i < TLC5940_MULTIPLEX_N; i++)
        TLC5940_SetGS(gsData, i, led[h],
                      TLC5940_GammaCorrect[*(data +
                                             h * width * TLC5940_MULTIPLEX_N +
                                             w * TLC5940_MULTIPLEX_N +
                                             i)]);
    /* printf("{\n"); */
    /* for (uint8_t d = 0; d < gsDataSize; d++) */
    /*   printf("{0x%02X, 0x%02X, 0x%02X}, ", */
    /*          gsData[d][0], gsData[d][1], gsData[d][2]); */
    /* printf("\n},\n"); */

    printf("{\n");
    for (uint8_t n = 0; n < TLC5940_MULTIPLEX_N; n++) {
      printf("{");
      for (uint16_t d = 0; d < gsDataSize; d++) {
        printf("0x%02X, ", gsData[d][n]);
      }
      printf("}, ");
    }
    printf("\n},\n");
  }
  printf("};\n");

 cleanup:
  png_free(png_ptr, row_pointers);
  png_free(png_ptr, data);

  png_destroy_read_struct(&png_ptr, &info_ptr, &end_info);
  fclose(fp);

  return errorVal;
}
