// Housing for the RPi Zero controller
// Units: millimeters
// Dimension reference: https://www.electronics-lab.com/raspberry-pi-zero-footprint-and-dimensions/

include<calc.scad>

module control_housing() {
    difference() {
        // mount for (30 x 65mm) RPi 0
        cube([72, 36, 5], center=true);

        // 3.2mm screw holes
        translate([58/2, 23/2, 0])   cylinder(5, 2.75/2);
        translate([-58/2, 23/2, 0])  cylinder(5, 2.75/2);
        translate([58/2, -23/2, 0])  cylinder(5, 2.75/2);
        translate([-58/2, -23/2, 0]) cylinder(5, 2.75/2);
    }

    translate([0, 0, -15]) {
        difference() {
            cube([24, 8, 30], center=true);
            translate([0, inches(1), 0]) rotate([90, 0, 0]) cylinder(d=inches(1.2*1/2), h=inches(2));
        }
    }
}

// debug
// control_housing();
