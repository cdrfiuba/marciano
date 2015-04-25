joystick_ext_rad = 25;
joystick_int_rad = 20.5;
joystick_depth = 90.5;

joystick_ext_rect_height = 40; // dimension in y
joystick_ext_rect_depth = joystick_depth;	 // dimension in z
joystick_ext_rect_width = 40; // dimension in x

joystick_int_rect_height = 40; // dimension in y
joystick_int_rect_depth = joystick_depth;	 // dimension in z
joystick_int_rect_width = 32; // dimension in x

support_hole_rad = 1.65; 
support_hole_height = 15; 
support_holes_spacing = 70;

buttons_hole_size = 13;
buttons_holes_spacing = 17.5;

module pcb_support_holes(){
	rotate([90, 0, 90]) {
  		cylinder(r=support_hole_rad, h=support_hole_height, $fn = 60);
	}

	translate([0, 0, support_holes_spacing]) {
		rotate([90, 0, 90]) {
	  		cylinder(r=support_hole_rad, h=support_hole_height, $fn = 60);
		}
	}
}

module control_buttons_holes(){
	cube([10, buttons_hole_size, buttons_hole_size]);

	translate([0, 0, buttons_holes_spacing]) {
		cube([10, buttons_hole_size, buttons_hole_size]);
	}

	translate([0, 0, buttons_holes_spacing*2]) {
		cube([10, buttons_hole_size, buttons_hole_size]);
	}

	translate([0, 0, buttons_holes_spacing*3]) {
		cube([10, buttons_hole_size, buttons_hole_size]);
	}

	translate([0, 0, buttons_holes_spacing*4]) {
		cube([10, buttons_hole_size, buttons_hole_size]);
	}
}


// ---------------------------------- //

difference() {
  	cylinder(r=joystick_ext_rad, h=joystick_depth, $fn = 60, center=true);
  	cylinder(r=joystick_int_rad, h=joystick_depth, $fn = 60, center=true);
	translate([-joystick_int_rect_width/2.4, 10, -joystick_int_rect_depth/2]) {
		cube([joystick_int_rect_width, joystick_int_rect_height, joystick_int_rect_depth]);
	}
}

difference() {
	translate([-joystick_ext_rect_height/2.4, 8, -joystick_ext_rect_depth/2]) {
 		cube([joystick_ext_rect_width, joystick_ext_rect_height, joystick_ext_rect_depth]);
	}
	translate([-joystick_int_rect_width/2.4, 8, -joystick_int_rect_depth/2]) {
		cube([joystick_int_rect_width, joystick_int_rect_height, joystick_int_rect_depth]);
	}
	cylinder(r=joystick_int_rad, h=joystick_depth, $fn = 60, center=true);
	
	translate([15, 35, -joystick_depth/2.4]) {
		pcb_support_holes();
	}
	translate([-20, 30, (-34.25 - 7)]) {
		control_buttons_holes();
	}
}	






