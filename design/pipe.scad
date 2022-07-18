// Generic PVC pipe

include<calc.scad>

module pipe(inches_id, inches_length) {
    linear_extrude(height = inches(inches_length)) {
        difference () {
            circle(d=inches(1.2*inches_id));
            circle(d=inches(inches_id));
            // circle(d=inches(1.2*inches_id), $fn=30*inches_id);
            // circle(d=inches(inches_id), $fn=30*inches_id);
        }
    }
}