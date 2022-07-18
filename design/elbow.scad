// PVC Pipe Elbow (not printed, just for viewing convenience)

include<calc.scad>

module elbow(inches_id) {

    // Rounded segment
    rotate_extrude(angle=90, convexity=2) {
        translate([inches(2/3), 0, 0])
        difference() {
            circle(d=inches(1.2*inches_id));
            circle(d=inches(inches_id));
        }
    }

    // linear segment
    translate([inches(2/3), -inches(1/2), 0])
    rotate([0, 90, 90])
    linear_extrude(height=inches(1/2)) {
        difference() {
            circle(d=inches(1.2*inches_id));
            circle(d=inches(inches_id));
        }
    }

    // linear segment
    translate([-inches(1/2), inches(2/3), 0])
    rotate([90, 0, 90])
    linear_extrude(height=inches(1/2)) {
        difference() {
            circle(d=inches(1.2*inches_id));
            circle(d=inches(inches_id));
        }
    }
}

// debug
// elbow(inches(3/4));
