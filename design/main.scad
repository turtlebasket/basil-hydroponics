include<NopSCADlib/lib.scad>
include<control-housing.scad>
include<structure.scad>

// rotation for STL export purposes
rotate([-90, 0, 0]) {

    // microcontroller 
    translate([inches(-13), inches(-1)+14, 9.5]) rotate([0, 50, 270]) {
        // housing
        control_housing();

        // 3.2mm standoffs (4x) connecting rpi to housing
        translate([58/2, 23/2, 0])   standoff(10, 3.2);
        translate([-58/2, 23/2, 0])  standoff(10, 3.2);
        translate([58/2, -23/2, 0])  standoff(10, 3.2);
        translate([-58/2, -23/2, 0]) standoff(10, 3.2);

        // rpi 0
        translate([0, 0, 10]) pcb(RPI0);
    }

    // microcontroller attaching arm

    // main structure
    structure();
}