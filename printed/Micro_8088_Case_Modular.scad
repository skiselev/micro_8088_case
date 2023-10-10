// 3D Printed Case for a Micro 8088 system
//
// Copyright (C) 2010 - 2023 Sergey Kiselev.
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

generate_preview = true;
render_back = false;
render_front = false;
render_bottom = false;
render_top = false;
render_left = false;
render_right = false;
render_slots_cover = false;
render_speaker_bracket = false;
render_keycap = false;
render_system_name = false;

// All dimensions are in mm
// Case size: depth - 200 mm * width = 200 mm, * height = 140 mm
// case outside dimensions
case_depth=200;
case_width=200;
case_height=140;
case_thickness=3.2;
// case inside dimensions
inside_height=case_height-case_thickness*2;
inside_depth=case_depth-case_thickness*2;
inside_width=case_width-case_thickness*2;
// TODO: cleanup case_top, case_front, case_right
case_top=case_height-case_thickness*2;
case_front=case_depth-case_thickness*2;
case_right=case_width-case_thickness*2;
corner_radius=1.6;
nut_inserts_radius = 2.6;       // corner radius for nut inserts
bracket_thickness=1.6;       // thickness of the material around ISA brackets
pcb_thickness=1.6;
in2mm=25.4;                  // mm per inch
mb_to_case_back=0.065*in2mm;
mb_to_case_left=5.06;       // carefully adjusted so that ISA brackets don't touch the nut insterts and there is 8 mm space between backplane and floppy drive
mb_to_left_slot=0.558*in2mm; // distance between the left edge of motherboard to the center of the leftmost slot cut-out
slot_height=0.61*in2mm;
slot_spacing=0.8*in2mm;  // distance between ISA slots
card_height=3.9*in2mm;   // height of an ISA card, not including edge connector
card_to_bracket_top=3.65*in2mm; // ISA card bottom to the top of the bracket
bracket_depth=0.45*in2mm;    // depth of an ISA bracket (top part inside)
bracket_height=card_to_bracket_top+slot_height;             // height of an ISA bracket (motherboard to top part inside)
bracket_width=0.72*in2mm; // width of an ISA bracket
tongue_cutout_width=12; // width of a cutout for the tongue of an ISA bracket

bracket_tab_offset = (0.740+0.110)*in2mm-bracket_width; // offset of the bracket tab relative to the bracket's left side
slots=7;                // number of slots
slots_area_width=slots*slot_spacing+bracket_tab_offset*2; // width of slots plus a bit more
slots_area_left=mb_to_case_left+mb_to_left_slot-bracket_width/2-bracket_tab_offset; // distance from the inside left wall to slots area
echo("bracket_tab_offset", bracket_tab_offset);
echo("slots_area_width", slots_area_width);

standoff_height=10;
standoff_radius=4;
m3_hole_radius=3.2/2;
m3_tap_hole_radius=3.0/2;
m3_head_radius=3;
floppy_width=101.6;
floppy_height=25.4;
floppy_depth=145;
floppy_mount_height=5;
floppy_mount_depth_1=21;
floppy_mount_depth_2=floppy_mount_depth_1+60;
floppy_mount_depth_3=floppy_mount_depth_1+90;
floppy_bezel_depth=4;
floppy_to_case_right=25.6; // bottom (left) of the floppy drive to inside right of the case
tolerance=0.1;

dc_socket_x=inside_height-25;   // relative to case inner top
dc_socket_y=180-case_thickness; // relative to case inner left
// TODO: cleanup dc_jack_y, dc_jack_z
dc_jack_y=180-case_thickness; // relative to case inner left
dc_jack_z=25;           // relative to case inner bottom

// speaker
speaker_radius=36/2;
speaker_height=4.5;
speaker_to_case_back=inside_depth-speaker_radius-case_thickness-5;
speaker_to_case_left=speaker_radius-case_thickness+25;

// distance between ventilation holes
vent_hole_radius=3;
vent_holes_horiz_step=10;
vent_holes_vert_step=sin(60)*vent_holes_horiz_step;

// case front panel settings
vent_holes_start_height=(case_height-12*vent_holes_vert_step)/2;
front_panel_width = 50;
front_panel_height = 14;
// center of the front panel
front_panel_x = vent_holes_start_height;
front_panel_y = case_width/2+2;
// the keycaps should stick out for 0.5 mm
front_panel_standoff_height=10-case_thickness-0.5;
button_radius = 3.25;
led_radius = 1.6;

// number of faces in circular objects
$fn=90;

echo("Space above ISA cards", case_top-standoff_height-pcb_thickness-slot_height-card_height);
echo("Maximal ISA card length", case_front-bracket_depth-mb_to_case_back);
echo("Space between backplane and floppy", case_width-case_thickness*2-mb_to_case_left-6.1*in2mm-floppy_to_case_right);

include <ISA_Brackets.scad>


if (render_back) {
    case_back();
}
if (render_front) {
    case_front();
}
if (render_bottom) {
    case_bottom();
}
if (render_top) {
    case_top();
}
if (render_left) {
    case_left();
}
if (render_right) {
    case_right();
}
if (render_slots_cover) {
    slots_cover();
}
if (render_speaker_bracket) {
    speaker_bracket();
}
if (render_keycap) {
    keycap_6mm_round();
}
if (render_system_name) {
    system_name();
}


if (generate_preview) {
    // back panel
    translate([0,0,case_height]) {
        rotate([0,90,0]) {
            color("cyan") case_back();
        }
    }
    translate([case_thickness+bracket_depth,case_thickness+slots_area_left,case_thickness+standoff_height+pcb_thickness]) {
        rotate([0,-90,0]) {
            color("blue") slots_cover();
        }
    }
    translate([case_thickness,case_thickness,0]) {
        color("orange") case_bottom();
    }
    // top panel
    translate([case_thickness,case_width-case_thickness,case_height]) {
        rotate([180,0,0]) {
            color("blue") case_top();
        }
    }
    // left panel
    translate([case_thickness,0,case_height]) {
        rotate([-90,0,0]) {
            color("green") case_left();
        }
    }
    // right panel
    translate([case_thickness,case_width,0]) {
        rotate([90,0,0]) {
            color("red") case_right();
        }
    }

    // front panel and related objects
    // translate to move front panel forward
    translate([case_depth,0,0]) {
        // rotate front panel from X-Y plane to Y-Z plane
        rotate([0,-90,0]) {
            // front panel
            color ("silver") front_panel();
            // keycaps for switches
            translate([front_panel_x,front_panel_y,5]) {
                // keycap for the left (power) button
                translate([0,4,0]) {
                    rotate([0,180,0]) {
                        color("blue") keycap_6mm_round();
                    }
                }
                // keycap for the left (power) button
                translate([0,-5,0]) {
                    rotate([0,180,0]) {
                        color("orange") keycap_6mm_round();
                    }
                }
            }   
            
            // system name text
            system_name();
            
        }
    }

    // motherboard and ISA brackets
    translate([case_thickness,case_thickness,case_thickness]) {
        // motherboard translate
        translate([mb_to_case_back+bracket_depth,mb_to_case_left,standoff_height]) {
            mb();
        }
        // ISA bracket
        translate([bracket_depth+br_thick,mb_to_case_left+mb_to_left_slot-br_width/2,standoff_height+pcb_thickness+bracket_height]) {
            rotate([90,90,180]) {
                eth_bracket();
            }
        }
    }
    // floppy drive
    translate([case_depth-floppy_depth-floppy_bezel_depth,case_width-floppy_to_case_right-case_thickness,(case_height-floppy_width)/2]) {
        floppy_drive();
    }

    // speaker bracket
    translate([speaker_to_case_back+case_thickness,speaker_to_case_left+case_thickness,speaker_height+case_thickness*2]) {
        rotate([180,0,90]) {
            color("purple") speaker_bracket();
        }
    }
}

module case_back() {
    vent_holes_top_height=vent_hole_radius+6;
    vent_holes_start_width=(inside_width-18*vent_holes_horiz_step)/2-5;
    
    bracket_top_offset=0.11*in2mm;
    hole_y=-bracket_width/2+bracket_top_offset+0.74*in2mm-0.125*in2mm;
    hole_z=0.25*in2mm;

    union() {
        difference() {
            case_front_back_panel();
            // various cutouts
            translate([case_thickness,case_thickness,-tolerance]) {
                // case back side
                // cutout for slots
                translate([inside_height+case_thickness-bracket_height-standoff_height-pcb_thickness,slots_area_left,0]) {
                    cube([bracket_height-case_thickness,slots_area_width,case_thickness+tolerance*2]);
                }
                // cutout for DC socket
                translate([dc_socket_x,dc_socket_y,0]) {
                    cylinder(h=case_thickness+tolerance*2,r1=10,r2=10-case_thickness);
                }
                // ventilation openings
                // top row
                for (vent_y = [vent_holes_start_width+vent_holes_horiz_step : vent_holes_horiz_step : inside_width-5]) {
                    translate([vent_holes_top_height,vent_y,0]) {
                        cylinder(h=case_thickness+tolerance*2,r=vent_hole_radius,$fn=6);
                    }
                }
                // above DC socket
                for (vent_y = [vent_holes_start_width+vent_holes_horiz_step*17 : vent_holes_horiz_step : inside_width-5]) {
                    for (vent_x = [vent_holes_top_height+vent_holes_vert_step*2 : vent_holes_vert_step*2 : dc_socket_x-15]) {
                        translate([vent_x,vent_y,0]) {
                            cylinder(h=case_thickness+tolerance*2,r=vent_hole_radius,$fn=6);
                        }
                    }
                }
                for (vent_y = [vent_holes_start_width+vent_holes_horiz_step*16.5 : vent_holes_horiz_step : inside_width-5]) {
                    for (vent_x = [vent_holes_top_height+vent_holes_vert_step : vent_holes_vert_step*2 : dc_socket_x-15 ]) {
                        translate([vent_x,vent_y,0]) {
                            cylinder(h=case_thickness+tolerance*2,r=vent_hole_radius,$fn=6);
                        }
                    }
                }
            }
        }
        // case inside translate
        translate([case_thickness,case_thickness,case_thickness]) {
            // DC socket mount
            translate([dc_socket_x,dc_socket_y,0]) {
                difference() {
                    cylinder(h=bracket_thickness,r1=10+bracket_thickness,r2=10);
                    translate([0,0,-tolerance]) cylinder(h=bracket_thickness+tolerance*2,r=4);
                }
            }
            // ISA slots
            difference() {
                union() {
                    // bottom part (under slots opennings)
                    translate([inside_height-pcb_thickness-standoff_height,slots_area_left,0]) {
                        cube([case_thickness,slots_area_width,bracket_depth]);
                    }
                    // left side
                    translate([inside_height-pcb_thickness-standoff_height-bracket_height,slots_area_left-bracket_thickness,0]){
                        cube([case_thickness+bracket_height,bracket_thickness,bracket_depth]);
                    }

                    // right side
                    translate([inside_height-pcb_thickness-standoff_height-bracket_height,slots_area_left+slots_area_width,0]){
                        cube([case_thickness+bracket_height,bracket_thickness,bracket_depth]);
                    }
                    // middle (slot cutouts area)
                    translate([inside_height-pcb_thickness-standoff_height-bracket_height,slots_area_left,bracket_depth-bracket_thickness]) {
                        cube([bracket_height,slots_area_width,bracket_thickness]);
                    }
                    // top/horizontal
                    translate([inside_height-bracket_height-pcb_thickness-standoff_height,slots_area_left,0]) {
                        cube([case_thickness,slots_area_width,bracket_depth]);
                    }
                }
                // ISA carts mounting holes
                for(slot_num = [0 : slots-1]) {
                    translate([inside_height-standoff_height-pcb_thickness-bracket_height-tolerance,mb_to_case_left+mb_to_left_slot+slot_spacing*slot_num+hole_y,hole_z ]) {
                        rotate([0,90,0]) cylinder(h=case_thickness+tolerance*2,r=m3_tap_hole_radius);
                    }
                }
                // cutout for the ISA slots cover
                translate([inside_height-standoff_height-pcb_thickness-bracket_height+case_thickness/2-tolerance,slots_area_left-0.6-tolerance,bracket_depth-bracket_thickness-tolerance]) {
                    cube([bracket_height+tolerance*2,slots_area_width+0.6*2+tolerance*2,bracket_thickness+tolerance*2]);
                }

                translate([inside_height-bracket_height-tolerance,slots_area_left-bracket_thickness-tolerance,bracket_depth-bracket_thickness-tolerance]) {
                    cube([bracket_height-20+tolerance*2,slots_area_width+bracket_thickness*2+tolerance*2,bracket_thickness+tolerance*2]);
                }
                
                translate([inside_height-bracket_height-tolerance,slots_area_left-bracket_thickness,bracket_depth-bracket_thickness*1.5-5]) {
                    rotate([45,0,0]) {
                        cube([bracket_height-20+tolerance*2, bracket_thickness/sqrt(2),bracket_thickness/sqrt(2)]);
                    }
                }
                
                translate([inside_height-bracket_height-tolerance,slots_area_left+slots_area_width+bracket_thickness,bracket_depth-bracket_thickness*1.5-5]) {
                    rotate([45,0,0]) {
                        cube([bracket_height-20+tolerance*2, bracket_thickness/sqrt(2),bracket_thickness/sqrt(2)]);
                    }
                }
            }
        }
    }
}

// case inside translate
//    translate([case_thickness+bracket_depth-bracket_thickness,case_thickness+slots_area_left,case_thickness+standoff_height+pcb_thickness])

module slots_cover() {
    bracket_top_offset=0.11*in2mm;
//    cutout_width=0.625*in2mm; // too wide, typical case has 0.5"
    cutout_width=0.5*in2mm;
//    cutout_height=3.688*in2mm;
    cutout_height=95;
    cutout_radius=1.27;
    mb_to_cutout=8.06-pcb_thickness;


    difference() {
        union() {
            translate([-case_thickness/2,-0.6,0]) {
                cube([bracket_height,slots_area_width+0.6*2,bracket_thickness]);
            }
            translate([20-standoff_height-pcb_thickness,-bracket_thickness-tolerance,0]) {
                cube([bracket_height-20,slots_area_width+bracket_thickness*2+tolerance*2,bracket_thickness]);
            }

            translate([20-standoff_height-pcb_thickness,-bracket_thickness*2-tolerance,0]) {
                cube([bracket_height-20,bracket_thickness,5+bracket_thickness*1.5]);
            }

            translate([20-standoff_height-pcb_thickness,slots_area_width+bracket_thickness+tolerance,0]) {
                cube([bracket_height-20,bracket_thickness,5+bracket_thickness*1.5]);
            }

            translate([20-standoff_height-pcb_thickness,-bracket_thickness-tolerance,5+bracket_thickness*0.5]) {
                rotate([45,0,0])
                cube([bracket_height-20,bracket_thickness/sqrt(2),bracket_thickness/sqrt(2)]);
            }
            translate([20-standoff_height-pcb_thickness,slots_area_width+bracket_thickness+tolerance,5+bracket_thickness*0.5]) {
                 rotate([45,0,0])
                 cube([bracket_height-20,bracket_thickness/sqrt(2),bracket_thickness/sqrt(2)]);
            }
        }
        translate([0,bracket_width/2+bracket_tab_offset,-tolerance]){
            // ISA slot cutouts
            for(slot_num = [0 : slots-1]) {
                translate([mb_to_cutout+cutout_radius,slot_spacing*slot_num-cutout_width/2+cutout_radius,0]) {
                    minkowski() {
                        cube([cutout_height-cutout_radius*2,cutout_width-cutout_radius*2,bracket_thickness+tolerance*2]);
                        cylinder(h=bracket_thickness+tolerance*2,r=cutout_radius);
                    }
                }
            }
        }
    }
}



module slots_cover1() {
    bracket_top_offset=0.11*in2mm;
//    cutout_width=0.625*in2mm; // too wide, typical case has 0.5"
    cutout_width=0.5*in2mm;
//    cutout_height=3.688*in2mm;
    cutout_height=95;
    cutout_radius=1.27;
    mb_to_cutout=8.06-pcb_thickness;


    // case inside translate
    translate([case_thickness+bracket_depth,case_thickness+slots_area_left,case_thickness]) {
        difference() {
            union() {
                translate([-bracket_thickness,-0.6,standoff_height+pcb_thickness-case_thickness/2]) {
                    cube([bracket_thickness,slots_area_width+0.6*2,bracket_height]);
                }
                translate([-bracket_thickness,-bracket_thickness-tolerance,20]) {
                    cube([bracket_thickness,slots_area_width+bracket_thickness*2+tolerance*2,bracket_height-20]);
                }

                translate([-5-bracket_thickness*1.5,-bracket_thickness*2-tolerance,20]) {
                    cube([5+bracket_thickness*1.5,bracket_thickness,bracket_height-20]);
                }

                translate([-5-bracket_thickness*1.5,+slots_area_width+bracket_thickness+tolerance,20]) {
                    cube([5+bracket_thickness*1.5,bracket_thickness,bracket_height-20]);
                }


                translate([-bracket_thickness-5,-bracket_thickness*1.5-tolerance,20]) {
                    rotate([0,0,45])
                    cube([bracket_thickness/sqrt(2),bracket_thickness/sqrt(2),bracket_height-20]);
                }
                translate([-bracket_thickness-5,slots_area_width+bracket_thickness*0.5+tolerance,20]) {
                    rotate([0,0,45])
                    cube([bracket_thickness/sqrt(2),bracket_thickness/sqrt(2),bracket_height-20]);
                }
            }
            translate([-bracket_thickness-tolerance,bracket_width/2+bracket_tab_offset,standoff_height+pcb_thickness]){
                // ISA slot cutouts
                for(slot_num = [0 : slots-1]) {
                    translate([0,slot_spacing*slot_num-cutout_width/2+cutout_radius,mb_to_cutout+cutout_radius]) {
                        minkowski() {
                            cube([bracket_thickness+tolerance*2,cutout_width-cutout_radius*2,cutout_height-cutout_radius*2]);
                            rotate([0,90,0]) cylinder(h=bracket_thickness+tolerance*2,r=cutout_radius);
                        }
                    }
                }
            }
        }
    }
}


module front_panel() {
    difference() {
        union () {
            case_front_back_panel();
            // front panel standoffs
            translate([front_panel_x,front_panel_y,case_thickness]) {
                translate([0,-20,0]) {
                    cylinder(h=front_panel_standoff_height,r=standoff_radius);
                }
                translate([0,20,0]) {
                    cylinder(h=front_panel_standoff_height,r=standoff_radius);
                }
            }
        }
        // floppy drive bazel cut-out
        translate([case_height/2-floppy_width/2-tolerance,case_width-case_thickness-floppy_to_case_right-tolerance,-tolerance]) {
            cube([floppy_width+tolerance*2,floppy_height+tolerance*2,case_thickness+tolerance*2]);
        }
        // system name text
        translate([case_height/2,case_width-floppy_to_case_right-15,0.2]) {
            // mirror the text
            rotate([0,180,0]) {
                linear_extrude(0.2+tolerance) {
                    text("Micro 8088",size=8,font = "Bahnschrift", halign="center");
                }
            }
        }
        // front panel cut-outs
        translate([front_panel_x,front_panel_y,-tolerance]) {
            // top LED
            translate([3,13,0]) {
                cylinder(h=case_thickness+tolerance*2,r=led_radius);
            }
            // bottom LED
            translate([-3,13,0]) {
                cylinder(h=case_thickness+tolerance*2,r=led_radius);
            }
            // right button
            translate([0,4,0]) {
                cylinder(h=case_thickness+tolerance*2,r=button_radius);
            }
            // left button
            translate([0,-5,0]) {
                cylinder(h=case_thickness+tolerance*2,r=button_radius);
            }
            // standoff holes
            translate([0,-20,case_thickness+tolerance]) {
                cylinder(h=front_panel_standoff_height+tolerance,r=m3_tap_hole_radius);
            }
            translate([0,20,case_thickness+tolerance]) {
                cylinder(h=front_panel_standoff_height+tolerance,r=m3_tap_hole_radius);
            }
        }
        // ventilation holes
        for (vent_y = [15 : vent_holes_horiz_step : case_width-floppy_to_case_right-15]) {
            for (vent_x = [vent_holes_start_height : vent_holes_vert_step*2 : case_height-vent_holes_start_height]) {
                if ((vent_x>front_panel_x)||((vent_x<=front_panel_x)&&((vent_y<front_panel_y-25)||vent_y>front_panel_y+25))) {
                    translate([vent_x,vent_y,-tolerance]) {
                        cylinder(h=case_thickness+tolerance*2,r=vent_hole_radius,$fn=6);
                    }
                }
            }
        }
        for (vent_y = [20 : vent_holes_horiz_step : case_width-floppy_to_case_right-20]) {
            for (vent_x = [vent_holes_start_height+vent_holes_vert_step : vent_holes_vert_step*2 :case_height-vent_holes_start_height ]) {
                translate([vent_x,vent_y,-tolerance]) {
                    cylinder(h=case_thickness+tolerance*2,r=vent_hole_radius,$fn=6);
                }
            }
        }
    }
}

// case front or back panels with nut inserts
module case_front_back_panel() {
    union() {
        rounded_cube8(case_width,case_height,case_thickness,corner_radius);
        // top / bottom support bars
        translate([case_thickness,case_thickness+15,case_thickness]) {
            cube([case_thickness,case_width-case_thickness*2-15*2,case_thickness]);
        }
        translate([case_height-case_thickness*2,case_thickness+15,case_thickness]) {
            cube([case_thickness,case_width-case_thickness*2-15*2,case_thickness]);
        }
        // side support bar
        translate([case_thickness+15,case_thickness,case_thickness]) {
            cube([case_height-case_thickness*2-15*2,case_thickness,case_thickness]);
        }
        
        // bottom left nut inserts
        translate([case_thickness,case_thickness,case_thickness]) {
            nut_inserts_corner();
        }
        // top left nut inserts
        translate([-case_thickness+case_height,case_thickness,case_thickness]) {
            rotate([0,0,90]) {
                nut_inserts_corner();
            }
        }
        // top right nut inserts
        translate([-case_thickness+case_height,-case_thickness+case_width,case_thickness]) {
            rotate([0,0,180]) {
                nut_inserts_corner();
            }
        }
        // bottom right nut inserts
        translate([case_thickness,-case_thickness+case_width,case_thickness]) {
            rotate([0,0,-90]) {
                nut_inserts_corner();
            }
        }
    }
}

module system_name() {
    // frame for the text
    difference() {
        cube([case_height,case_width,0.2]);
        translate([0.8,0.8,-tolerance]) {
            cube([case_height-0.8*2,case_width-0.8*2,0.2+tolerance*2]);
        }
    }
    // system name text
    translate([case_height/2,case_width-floppy_to_case_right-15,0.2]) {
        // mirror the text
        rotate([0,180,0]) {
            color ("blue") linear_extrude(0.2) {
                text("Micro 8088",size=8,font = "Bahnschrift", halign="center");
            }
        }
    }
}

// case bottom side
module case_bottom() {
    difference() {
        union() {
            case_top_bottom_panel();
            // speaker
            translate([speaker_to_case_back,speaker_to_case_left,case_thickness]){
                // speaker center circle
                cylinder(h=speaker_height,r=speaker_radius+case_thickness);
                // speaker mount standoffs
                translate([15,15,0]) {
                    cylinder(h=speaker_height,r=standoff_radius);
                }
                translate([-15,-15,0]) {
                    cylinder(h=speaker_height,r=standoff_radius);
                }
            }
        }
        // ISA brackets cut-outs
        translate([0,0,case_thickness]) {
            for(slot_num = [0 : slots-1]) {
                 translate([bracket_depth-tolerance,mb_to_case_left+mb_to_left_slot+slot_spacing*slot_num-tongue_cutout_width/2,-1]) {
                    cube([mb_to_case_back+tolerance*2,tongue_cutout_width,1+tolerance]);
                 }
            } 
        }
        
        // speaker cut-outs
        translate([speaker_to_case_back,speaker_to_case_left,case_thickness]){
            // speaker center cut-out
            cylinder(h=speaker_height+tolerance,r=speaker_radius+tolerance);
            translate([15,15,0]) {
                cylinder(h=speaker_height+tolerance,r=m3_tap_hole_radius);
            }
            translate([-15,-15,0]) {
                cylinder(h=speaker_height+tolerance,r=m3_tap_hole_radius);
            }
            // speaker grill
            translate([vent_holes_vert_step,0,-case_thickness-tolerance]) {
                cylinder(h=case_thickness+tolerance*2,r=vent_hole_radius,$fn=6);
            }
            translate([-vent_holes_vert_step,0,-case_thickness-tolerance]) {
                cylinder(h=case_thickness+tolerance*2,r=vent_hole_radius,$fn=6);
            }
            translate([0,vent_holes_horiz_step*0.5,-case_thickness-tolerance]) {
                cylinder(h=case_thickness+tolerance*2,r=vent_hole_radius,$fn=6);
            }
            translate([0,-vent_holes_horiz_step*0.5,-case_thickness-tolerance]) {
                cylinder(h=case_thickness+tolerance*2,r=vent_hole_radius,$fn=6);
            }
            translate([0,vent_holes_horiz_step*1.5,-case_thickness-tolerance]) {
                cylinder(h=case_thickness+tolerance*2,r=vent_hole_radius,$fn=6);
            }
            translate([0,-vent_holes_horiz_step*1.5,-case_thickness-tolerance]) {
                cylinder(h=case_thickness+tolerance*2,r=vent_hole_radius,$fn=6);
            }

            translate([vent_holes_vert_step,vent_holes_horiz_step,-case_thickness-tolerance]) {
                cylinder(h=case_thickness+tolerance*2,r=vent_hole_radius,$fn=6);
            }
            translate([-vent_holes_vert_step,vent_holes_horiz_step,-case_thickness-tolerance]) {
                cylinder(h=case_thickness+tolerance*2,r=vent_hole_radius,$fn=6);
            }

            translate([vent_holes_vert_step,-vent_holes_horiz_step,-case_thickness-tolerance]) {
                cylinder(h=case_thickness+tolerance*2,r=vent_hole_radius,$fn=6);
            }
            translate([-vent_holes_vert_step,-vent_holes_horiz_step,-case_thickness-tolerance]) {
                cylinder(h=case_thickness+tolerance*2,r=vent_hole_radius,$fn=6);
            }
        }
    }
    // case inside translate
    translate([0,0,case_thickness]) {
        // motherboard - standoffs
        // motherboard translate
        translate([mb_to_case_back+bracket_depth,mb_to_case_left,0]) {
            // motherboard standoffs
            translate([10.16,13.97,0]) {
                mb_standoff();
            }
            translate([111.76,13.97,0]) {
                mb_standoff();
            }
            translate([10.16,80.01,0]) {
                mb_standoff();
            }
            translate([111.76,80.01,0]) {
                mb_standoff();
            }
            translate([10.16,140.97,0]) {
                mb_standoff();
            }
            translate([111.76,140.97,0]) {
                mb_standoff();
            }
        }
    }
}

module case_top() {
    case_top_bottom_panel();
}

// case top or bottom panels with mounting holes
module case_top_bottom_panel() {
    union() {
        difference() {
            translate([tolerance,tolerance,0]) {
                cube([inside_depth-tolerance*2,inside_width-tolerance*2,case_thickness]);
            }
            // left / back screw hole
            translate([9,9,0]) {
                m3_flat_screw_hole();
            }
            // right / back screw hole
            translate([9,inside_width-9,0]) {
                m3_flat_screw_hole();
            }
            // left / from screw hole
            translate([inside_depth-9,9,0]) {
                m3_flat_screw_hole();
            }
            // right / from screw hole
            translate([inside_depth-9,inside_width-9,0]) {
                m3_flat_screw_hole();
            }
        }
    }
}

// case left side
module case_left() {
    case_side_panel();
}

// case right side
// include mounts for the floppy drive
module case_right() {
    case_side_panel();
    // bottom floppy mount
    translate([case_depth-floppy_mount_depth_3-floppy_mount_height-floppy_bezel_depth-case_thickness,0,case_thickness+floppy_to_case_right]) {
        // bottom floppy mount
        translate([0,case_height/2-floppy_width/2-case_thickness-tolerance,0]) {
            rotate([-90,0,0]) {
                floppy_mount();
            }
        }
        // top floppy mount
        translate([0,case_height/2+floppy_width/2+tolerance,0]) {
            rotate([-90,0,0]) {
                floppy_mount();
            }
        }
    }
}

// case left or right panels with mounting holes
// plane: x-y for depth and height
// origin: 0,0 - needs to be rotated and shifted to fit the case
module case_side_panel() {
    difference() {
        union() {
            // panel
            translate([tolerance,0,0]) {
                rounded_cube2(inside_depth-tolerance*2,case_height,case_thickness,corner_radius);
            }
            // bottom support rail
            translate([12+tolerance,case_thickness,case_thickness]) {
                cube([inside_depth-12*2-tolerance*2,case_thickness,case_thickness]);
            }
            // top support rail
            translate([12+tolerance,case_height-case_thickness*2,case_thickness]) {
                cube([inside_depth-12*2-tolerance*2,case_thickness,case_thickness]);
            }
        }
        translate([0,case_thickness,0]) {
            // back / bottom screw hole
            translate([9,9,0]) {
                m3_flat_screw_hole();
            }
            // back / top screw hole
            translate([9,inside_height-9,0]) {
                m3_flat_screw_hole();
            }
            // front / bottom screw hole
            translate([inside_depth-9,9,0]) {
                m3_flat_screw_hole();
            }
            // front / top screw hole
            translate([inside_depth-9,inside_height-9,0]) {
                m3_flat_screw_hole();
            }
        }
    }
}

module floppy_mount() {
    difference() {
        union() {
            // two overlapping rectangles
            translate([0,floppy_mount_height,0]) {
                cube([floppy_mount_depth_3-floppy_mount_depth_1+floppy_mount_height*2,floppy_to_case_right-floppy_mount_height,case_thickness]);
            }
            translate([floppy_mount_height,0,0]) {
                cube([floppy_mount_depth_3-floppy_mount_depth_1,floppy_to_case_right,case_thickness]);
            }
            // rounded corner 1
            translate([floppy_mount_height,floppy_mount_height]) {
                cylinder(h=case_thickness,r=floppy_mount_height);
            }
            // rounded corner 2
            translate([floppy_mount_depth_3-floppy_mount_depth_1+floppy_mount_height,floppy_mount_height]) {
                cylinder(h=case_thickness,r=floppy_mount_height);
            }
        }
        // floppy mount hole 1
        translate([floppy_mount_height,floppy_mount_height,0]) {
            m3_screw_hole();
        }
        // floppy mount hole 2
        translate([floppy_mount_depth_3-floppy_mount_depth_2+floppy_mount_height,floppy_mount_height,0]) {
            m3_screw_hole();
        }
        // floppy mount hole 3
        translate([floppy_mount_depth_3-floppy_mount_depth_1+floppy_mount_height,floppy_mount_height,-0]) {
            m3_screw_hole();
        }
    }
}

module mb_standoff() {
    difference() {
        union() {
            cylinder(h=standoff_radius*0.5,r1=standoff_radius*1.5,r2=standoff_radius);
            cylinder(h=standoff_height,r=standoff_radius);
        }
        // screw hole
        cylinder(h=standoff_height,r=m3_tap_hole_radius);
    }
}

module speaker_bracket() {
    difference() {
        hull() {
            // rounded sides
            translate([15,15,0]) {
                cylinder(h=case_thickness,r=standoff_radius);
            }
            translate([-15,-15,0]) {
                cylinder(h=case_thickness,r=standoff_radius);
            }
        }
        translate([15,15,0]) {
            m3_flat_screw_hole();
        }
        translate([-15,-15,0]) {
            m3_flat_screw_hole();
        }
    }
}

module mb()
{
    isa_slot_x=87.88;
    isa_slot_y=9.1;
    isa_slot_z=15.42;
    isa_edge_x=84.12;
    isa_edge_y=2;
    isa_edge_z=0.3*in2mm;
    // motherboard PCB
    color("blue") {
        difference() {
            cube([4.6*in2mm,6.1*in2mm,pcb_thickness]);
            // motherboard mounting holes
            translate([10.16,13.97,-tolerance]) {
                cylinder(h=pcb_thickness+tolerance*2,r=2);
            }
            translate([111.76,13.97,-tolerance]) {
                cylinder(h=pcb_thickness+tolerance*2,r=2);
            }
            translate([10.16,80.01,-tolerance]) {
                cylinder(h=pcb_thickness+tolerance*2,r=2);
            }
            translate([111.76,80.01,-tolerance]) {
                cylinder(h=pcb_thickness+tolerance*2,r=2);
            }
            translate([10.16,140.97,-tolerance]) {
                cylinder(h=pcb_thickness+tolerance*2,r=2);
            }
            translate([111.76,140.97,-tolerance]) {
                cylinder(h=pcb_thickness+tolerance*2,r=2);
            }
        }
    }
    // isa slots
    color("DarkSlateGray") {
        for(slot_num = [0 : slots-1]) {
            difference() {
                translate([2.5*in2mm-isa_slot_x/2,slot_spacing*slot_num+0.25*in2mm-isa_slot_y/2,pcb_thickness]) {
                    cube([isa_slot_x,isa_slot_y,isa_slot_z]);
                }
                translate([2.5*in2mm-isa_edge_x/2,slot_spacing*slot_num+0.25*in2mm-isa_edge_y/2,pcb_thickness+isa_slot_z-isa_edge_z]) {
                    cube([isa_edge_x,isa_edge_y,isa_edge_z+tolerance]);
                }
            }
        }
    }
}

module floppy_drive() {
    color("silver") difference() {
        cube([floppy_depth,floppy_height,floppy_width]);
        translate([floppy_depth-floppy_mount_depth_1,floppy_mount_height,-tolerance]) {
            cylinder(h=6,r=1.5);
        }
        translate([floppy_depth-floppy_mount_depth_2,floppy_mount_height,-tolerance]) {
            cylinder(h=6,r=1.5);
        }
        translate([floppy_depth-floppy_mount_depth_3,floppy_mount_height,-tolerance]) {
            cylinder(h=6,r=1.5);
        }
        translate([floppy_depth-floppy_mount_depth_1,floppy_mount_height,floppy_width-6+tolerance]) {
            cylinder(h=6,r=1.5);
        }
        translate([floppy_depth-floppy_mount_depth_2,floppy_mount_height,floppy_width-6+tolerance]) {
            cylinder(h=6,r=1.5);
        }
        translate([floppy_depth-floppy_mount_depth_3,floppy_mount_height,floppy_width-6+tolerance]) {
            cylinder(h=6,r=1.5);
        }
    }
    
    union() {
        // bezel
        color("ivory") {
            difference () {
                translate([floppy_depth,0,0]) {
                    cube([floppy_bezel_depth,floppy_height,floppy_width]);
                }
                translate([floppy_depth+floppy_bezel_depth-1,3,floppy_width/2-36/2]) {
                    cube([1.1,20,36]);
                }
            }
        }
        // eject button
        translate([floppy_depth+floppy_bezel_depth,6-6/2,floppy_width/2-30-11.5/2]) {
            color("beige") cube([1,6,11.5]);
        }
        // LED
        translate([floppy_depth+floppy_bezel_depth,6-2/2,floppy_width/2+27.5-5/2]) {
            color("SpringGreen") cube([0.5,2,5]);
        }
        // diskette
        translate([floppy_depth+floppy_bezel_depth,17-4.6/2,(floppy_width-90.6)/2]) {
            color("blue") cube ([15,4.6,90.6]);
        }
    }
}

// rectangluar prism with rounded edges on 2 out of 12 sides
module rounded_cube2(depth,width,height,radius) {
    union() {
        translate([0,radius,radius]) {
            rotate([0,90,0]) {
                cylinder(h=depth,r=radius);
            }
        }
        translate([0,width-radius,radius]) {
            rotate([0,90,0]) {
                cylinder(h=depth,r=radius);
            }
        }
        translate([0,radius,0]) {
            cube([depth,width-radius*2,radius]);
        }
        translate([0,0,radius]) {
            cube([depth,width,height-radius]);
        }
    }
}

// rectangluar prism with rounded edges on 8 out of 12 sides
module rounded_cube8(x,y,z,radius) {
    union() {
        translate([radius,radius,radius]) {
            rotate([0,90,0]) {
                cylinder(h=y-radius*2,r=radius);
            }
            rotate([270,0,0]) {
                cylinder(h=x-radius*2,r=radius);
            }
            cylinder(h=z-radius,r=radius);
            sphere(r=radius);
        }
        translate([radius,x-radius,radius]) {
            rotate([0,90,0]) {
                cylinder(h=y-radius*2,r=radius);
            }
            cylinder(h=z-radius,r=radius);
            sphere(r=radius);
        }
        translate([y-radius,radius,radius]) {
            rotate([270,0,0]) {
                cylinder(h=x-radius*2,r=radius);
            }
            cylinder(h=z-radius,r=radius);
            sphere(r=radius);
        }
        translate([y-radius,x-radius,radius]) {
            cylinder(h=z-radius,r=radius);
            sphere(r=radius);
        }
        
        translate([radius,radius,0]) {
            cube([y-radius*2,x-radius*2,radius]);
        }
        translate([radius,0,radius]) {
            cube([y-radius*2,x,z-radius]);
        }
        translate([0,radius,radius]) {
            cube([y,x-radius*2,z-radius]);
        }
    }
}

// corner piece with two nut inserts
// size: X*Y*Z = 15*15*12
// hole centers: X*Y*Z = 0,9,9 and X*Y*Z = 9,0,9
module nut_inserts_corner() {
    union() {
        translate([3,6,0]) {
            rotate([90,0,0]) {
                nut_insert();
            }
        }
        translate([0,3,0]) {
            rotate([90,0,90]) {
            
                nut_insert();
            }
        }
        cube([3,3,12]);
    }
}

// nut insert with a cutout for a square nut
// lays down X-Y plane, screw hole is parallel to Z axis
module nut_insert() {
    difference() {
        // corner plastic
        union() {
            cube([12-nut_inserts_radius,12,6]);
            cube([12,12-nut_inserts_radius,6]);
            translate([12-nut_inserts_radius,12-nut_inserts_radius,0]) {
                cylinder(h=6,r=nut_inserts_radius);
            }
        }
        // cutouts
        // screw hole
        translate([6,9,-tolerance]){
            cylinder(h=6+tolerance*2,r=m3_hole_radius);
        }
        // nut slot
        translate([3,6,2]) {
            cube([6,6+tolerance,2]);
        }
    }
}

// keycap for tactile switch
module keycap_6mm_round(){
    keycap_radius = 3;
    keycap_height = 5.5;
    keycap_top_radius = 2.8;
    skirt_height = 1;
    stem_width = 2.5;
    stem_height = 2.8;
    difference() {
        union() {
            // keycap
            cylinder(h=keycap_height-(keycap_radius-keycap_top_radius),r=keycap_radius);
            // skirt
            cylinder(h=skirt_height,r1=keycap_radius+skirt_height,r2=keycap_radius);
            // keycap top
            translate([0,0,keycap_height-(keycap_radius-keycap_top_radius)]) {
                cylinder(h=(keycap_radius-keycap_top_radius),r1=keycap_radius, r2=keycap_top_radius);
            }
        }
        // cutout to allow expansion when putting the keycap on the button
        translate([-(keycap_radius+skirt_height)-tolerance,-1.8/2,-tolerance]) {
            cube([(keycap_radius+skirt_height)*2+tolerance*2,1.8,2+tolerance]);
        }
        // cutout for the stem
        translate([-stem_width/2,-stem_width/2,-tolerance]) {
            cube([stem_width,stem_width,stem_height+tolerance]);
        }
    }
    // latch for the stem
    translate([-stem_width/2,-stem_width/2,0.4]) {
        cube([stem_width,0.1,0.4]);
    }
    translate([-stem_width/2,stem_width/2-0.1,0.4]) {
        cube([stem_width,0.1,0.4]);
    }
}

module m3_flat_screw_hole() {
    translate([0,0,-tolerance]) {
        cylinder(h=case_thickness+tolerance*3, r=m3_hole_radius);
        cylinder(h=0.5+0.01,r=m3_head_radius);
        translate([0,0,0.5]) {
            cylinder(h=m3_head_radius,r1=m3_head_radius,r2=0);
        }
    }
}

module m3_screw_hole() {
    translate([0,0,-tolerance]) {
        cylinder(h=case_thickness+tolerance*3, r=m3_hole_radius);
    }
}
