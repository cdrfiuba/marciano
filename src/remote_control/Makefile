#!/usr/bin/make

########################################################################

# *** Fill out this information *** 

# Multiple Target Project
# For each target, specify project name and the list of the objects files 
# to be compiled/assembled
PROJECT1 = remote_control
OBJECTS1 = control.o i2c_accelerometer.o

PROJECT2 = controlled_car
OBJECTS2 = auto.o

# Add a description for each target
default:
	@echo 'Options:'
	@echo '  make control  |  Builds remote_control.bin for the mbed cars remotes control.'
	@echo '  make car      |  Builds controlled_car for the mbed car.'
	@echo '  make cleanall |  Deletes all binaries'

# Add a name rule for each target
control:
	make all PROJECT=$(PROJECT1)

car:
	make all PROJECT=$(PROJECT2)

cleanall:
	make clean PROJECT=$(PROJECT1)
	make clean PROJECT=$(PROJECT2)

ifeq ($(PROJECT),$(PROJECT1))
OBJECTS = $(OBJECTS1)
else ifeq ($(PROJECT),$(PROJECT2))
OBJECTS = $(OBJECTS2) 
endif

# Selected architecture/board
ARCH = lpc17xx/mbed
# Programming language for this project (C for C, CPP for C++)
LANGUAGE = CPP

# Compiling options
DEBUG = 
OPTIMIZATION = 2
CFLAGS = -Wall

########################################################################

# Path to the library
LIB_BASE := ../../../libmanyuc/src

# Include libmanyuc's Makefile to take care of the rest
include $(LIB_BASE)/Makefile

