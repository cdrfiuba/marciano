joystick_ext_rad = 25;
joystick_int_rad = 23;
joystick_depth = 90.5;

joystick_ext_rect_height = 40; // dimension in y
joystick_ext_rect_depth = joystick_depth;	 // dimension in z
joystick_ext_rect_width = 40; // dimension in x

joystick_int_rect_height = 40; // dimension in y
joystick_int_rect_depth = joystick_depth;	 // dimension in z
joystick_int_rect_width = 34; // dimension in x


difference() {
  	cylinder(r=joystick_ext_rad, h=joystick_depth, center=true);
  	cylinder(r=joystick_int_rad, h=joystick_depth, center=true);
	translate([-joystick_int_rect_width/2.5, 10, -joystick_int_rect_depth/2]) {
		cube([joystick_int_rect_width, joystick_int_rect_height, joystick_int_rect_depth]);
	}
}

difference() {
	translate([-joystick_ext_rect_height/2.5, 8, -joystick_ext_rect_depth/2]) {
 		cube([joystick_ext_rect_width, joystick_ext_rect_height, joystick_ext_rect_depth]);
	}
	translate([-joystick_int_rect_width/2.5, 8, -joystick_int_rect_depth/2]) {
		cube([joystick_int_rect_width, joystick_int_rect_height, joystick_int_rect_depth]);
	}
	cylinder(r=joystick_int_rad, h=joystick_depth, center=true);
}		





