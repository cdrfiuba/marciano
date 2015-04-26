use <Write.scad>


joystick_ext_rad = 20.5;
joystick_int_rad = 17;
joystick_depth = 84.5;


keyboard_ext_rect_height = 40; // dimension in y
keyboard_ext_rect_depth = joystick_depth;	 // dimension in z
keyboard_ext_rect_width = 40; // dimension in x

keyboard_int_rect_height = 40; // dimension in y
keyboard_int_rect_depth = joystick_depth;	 // dimension in z
keyboard_int_rect_width = 34; // dimension in x

keyboard_contour_diff_height = 7; // dimension in y
keyboard_contour_diff_depth = joystick_depth;	 // dimension in z
keyboard_contour_diff_width = 10; // dimension in x


support_hole_rad = 1.75; 
support_hole_height = 15; 
support_holes_spacing = 65;

buttons_hole_size = 12.5;
buttons_holes_spacing = 16.5;



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

	translate([0, -3, 0]) {
		cube([10, buttons_hole_size, buttons_hole_size]);
	}

	translate([0, 0, buttons_holes_spacing]) {
		cube([10, buttons_hole_size, buttons_hole_size]);
	}

	translate([0, 0, buttons_holes_spacing*2]) {
		cube([10, buttons_hole_size, buttons_hole_size]);
	}

	translate([0, 0, buttons_holes_spacing*3]) {
		cube([10, buttons_hole_size, buttons_hole_size]);
	}

	translate([0, -3, buttons_holes_spacing*4]) {
		cube([10, buttons_hole_size, buttons_hole_size]);
	}
}


module keyboard(){

	difference() {
		translate([-keyboard_ext_rect_height/2, 8, -keyboard_ext_rect_depth/2]) {
 			cube([keyboard_ext_rect_width, keyboard_ext_rect_height, keyboard_ext_rect_depth]);
		}
		translate([-keyboard_int_rect_width/2, 8, -keyboard_int_rect_depth/2]) {
			cube([keyboard_int_rect_width, keyboard_int_rect_height, keyboard_int_rect_depth]);
		}
		translate([-keyboard_ext_rect_height/2 - 5, 41, -keyboard_ext_rect_depth/2]) {
			cube([keyboard_contour_diff_width, keyboard_contour_diff_height, keyboard_contour_diff_depth]);
		}

		cylinder(r=joystick_int_rad, h=joystick_depth, $fn = 60, center=true);
	
		translate([15, 35, -joystick_depth + 52]) {
			pcb_support_holes();
		}
		translate([-20, 23, (-34.25 - 5)]) {
			control_buttons_holes();
		}
	}
}	


module joystick(){

	union(){
		difference() {
  			cylinder(r=joystick_ext_rad, h=joystick_depth, $fn = 80, center=true);
  			cylinder(r=joystick_int_rad, h=joystick_depth, $fn = 80, center=true);
			translate([-keyboard_int_rect_width/2, 0, -keyboard_int_rect_depth/2]) {	
				cube([keyboard_int_rect_width, keyboard_int_rect_height, keyboard_int_rect_depth]);
			}
		}

		translate([0, 0, 41.5]){ 
			difference(){
				rotate_extrude(convexity = 10)
				translate([18.7, 0, 0])
				circle(r = 2, $fn = 60);

				translate([-20, 4, -3]){
					cube([40, 40, 6]);	
				}	
			}
		}

		translate([0, -5, 0]){	
			keyboard();
		}
	}
}


// -------- Instance --------- //

// joystick left hand

joystick();
writecylinder("MARCIANO",[0,-.4,0], 20.5,h = 6,rotate=180,center=true, font = "orbitron.dxf"); 


// joystick right hand

rotate([180, 0, 0]){
	translate([0, -120, 0]){
		mirror([0,0,1]){
			joystick();
		}
		rotate([180, 0, 180]){
			writecylinder("MARCIANO",[0,-.4,0], 20.5,h = 6,rotate=-180,center=true, font = "orbitron.dxf"); 
		}
	}
}
