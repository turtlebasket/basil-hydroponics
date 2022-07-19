// Main hydroponics structure

include<NopSCADlib/lib.scad>
include<calc.scad>
include<elbow.scad>
include<pipe.scad>

// 1/2in to 3.5in PVC adapter.
module adapter() {
    cylHeight = 1.0;
    cylinder(h=inches(cylHeight), d1=inches(1/2), d2=1.3*inches(3.5));
    cylinder(h=inches(1/4), d=1.4*inches(1/2));
    translate([0, 0, inches(cylHeight)]) cylinder(h=inches(1/4), d=1.3*inches(3.5));
}

module cap() {
    cylinder(h=inches(1), d=1.3*inches(3.5));
}

module structure() {
    translate([inches(-11), 0, 0]) {
        // bottom PVC planter
        translate([0, 0, 0]) rotate([0, 90, 0]) difference() {
            pipe(3.5, 22);
            // cut planter holes
            translate([-inches(2.5), 0, inches(3.5)]) rotate([0, 90, 0]) cylinder(r=inches(1.25), h=inches(3));
            translate([-inches(2.5), 0, inches(8.5)]) rotate([0, 90, 0]) cylinder(r=inches(1.25), h=inches(3));
            translate([-inches(2.5), 0, inches(13.5)]) rotate([0, 90, 0]) cylinder(r=inches(1.25), h=inches(3));
            translate([-inches(2.5), 0, inches(18.5)]) rotate([0, 90, 0]) cylinder(r=inches(1.25), h=inches(3));
        }

        // inter-planter connector
        translate([inches(22), 0, 0]) rotate([0, 90, 0]) pipe(1/2, 3);
        translate([inches(22+3), 0, inches(2/3)]) rotate([90, 90, 0]) elbow(3/5);
        translate([inches(22+3+2/3), 0, inches(2/3)]) rotate([0, 0, 90]) pipe(1/2, 12-4/3);
        translate([inches(22+3), 0, inches(12-2/3)]) rotate([90, 0, 0]) elbow(3/5);
        translate([inches(22), 0, inches(12)]) rotate([0, 90, 0]) pipe(1/2, 3);

        // middle PVC planter
        translate([0, 0, inches(12)]) rotate([0, 90, 0]) difference() {
            pipe(3.5, 22);
            // cut planter holes
            translate([-inches(2.5), 0, inches(3.5)]) rotate([0, 90, 0]) cylinder(r=inches(1.25), h=inches(3));
            translate([-inches(2.5), 0, inches(8.5)]) rotate([0, 90, 0]) cylinder(r=inches(1.25), h=inches(3));
            translate([-inches(2.5), 0, inches(13.5)]) rotate([0, 90, 0]) cylinder(r=inches(1.25), h=inches(3));
            translate([-inches(2.5), 0, inches(18.5)]) rotate([0, 90, 0]) cylinder(r=inches(1.25), h=inches(3));
        }

        // inter-planter connector 2
        mirror([-1, 0, 0]) translate([inches(0), 0, inches(12)]) rotate([0, 90, 0]) pipe(1/2, 3);
        mirror([-1, 0, 0]) translate([inches(0+3), 0, inches(12+2/3)]) rotate([90, 90, 0]) elbow(3/5);
        mirror([-1, 0, 0]) translate([inches(0+3+2/3), 0, inches(12+2/3)]) rotate([0, 0, 90]) pipe(1/2, 12-4/3);
        mirror([-1, 0, 0]) translate([inches(0+3), 0, inches(12+12-2/3)]) rotate([90, 0, 0]) elbow(3/5);
        mirror([-1, 0, 0]) translate([inches(0), 0, inches(12+12)]) rotate([0, 90, 0]) pipe(1/2, 3);

        // middle PVC planter
        translate([0, 0, inches(24)]) rotate([0, 90, 0]) difference() {
            pipe(3.5, 22);
            // cut planter holes
            translate([-inches(2.5), 0, inches(3.5)]) rotate([0, 90, 0]) cylinder(r=inches(1.25), h=inches(3));
            translate([-inches(2.5), 0, inches(8.5)]) rotate([0, 90, 0]) cylinder(r=inches(1.25), h=inches(3));
            translate([-inches(2.5), 0, inches(13.5)]) rotate([0, 90, 0]) cylinder(r=inches(1.25), h=inches(3));
            translate([-inches(2.5), 0, inches(18.5)]) rotate([0, 90, 0]) cylinder(r=inches(1.25), h=inches(3));
        }


        // PVC adapters
        translate([inches(23), 0, 0]) rotate([0, -90, 0]) adapter();
        translate([inches(23), 0, inches(12)]) rotate([0, -90, 0]) adapter();
        translate([-inches(1), 0, 0]) rotate([0, 90, 0]) adapter();
        translate([-inches(1), 0, inches(12)]) rotate([0, 90, 0]) adapter();
        translate([-inches(1), 0, inches(24)]) rotate([0, 90, 0]) adapter();

        // cap top planter
        translate([inches(23), 0, inches(24)]) rotate([0, -90, 0]) cap();

        // in pipe (top)
        translate([inches(22), 0, inches(24)]) rotate([90, 0, 90]) pipe(1/2, 3);
        translate([inches(22+3), inches(2/3), inches(24)]) rotate([180, 180, 90]) elbow(3/5);
        translate([inches(22+3+2/3), inches(1+2/3), inches(24-2/3)]) rotate([90, 0, 90]) elbow(3/5);
        translate([inches(22+3+2/3), inches(2+1/3), inches(24-2/3)]) rotate([180, 0, 90]) pipe(1/2, 24);
        translate([inches(22+3+2/3), inches(1+2/3), inches(-2/3)]) rotate([-90, 0, 90]) elbow(3/5);
        translate([inches(22+3+2/3), inches(2-1/3), inches(-1-1/3)]) rotate([90, 0, 0]) pipe(1/2, 4);

        // out pipe (bottom)
        translate([0, 0, 0]) rotate([90, 0, -90]) pipe(1/2, 3);
        translate([inches(-3), inches(-2/3), 0]) rotate([0, 0, 90]) elbow(3/5);
        translate([inches(-3-2/3), inches(-2/3), 0]) rotate([90, 0, 0]) pipe(1/2, 2);
    }
}

// debug
// structure();
