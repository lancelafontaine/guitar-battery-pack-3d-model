$fn = 100;

module base() {
    difference() {
        cube([82, 31, 3], center=true);
        difference() {
            cube([82, 31, 3], center=true);
            translate([25.3,0,0]) {
                cylinder(h=3, r=15.8, center=true);
            }
            translate([-25.3,0,0]) {
                cylinder(h=3, r=15.8, center=true);
            }
            cube([57,31,4], center=true);
        }  
    }
}

module drillhole() {
    cylinder(h=3, r1=1, r2=2.25, center=true);
}


module drilled_base() {
    difference() {
        base();
        translate([37,0,0]) {
            drillhole();
        }
        translate([-37,0,0]) {
            drillhole();
        } 
    }
}

module lid() {
    translate([-0.5,0,0]) {
        cube([59,18.8,3], center=true);
        translate([-1.5,0,-0.75]) {
            cube([61,17,1.5], center=true);
        }
    }
    latch();
}

module lid_without_latch() {
    cube([60,19,3], center=true);
    translate([-1,0,-0.75]) {
        cube([62,19,1.5], center=true);
    }
    translate([1,0,0]) {
        cube([62,15,1.2], center=true);
    }
}

module latch_down() {
    rotate(a=75, v=[0,1,0]) {
        cube([6,14,0.7], center=true);
    }
}
module latch_up() {
    rotate(a=83, v=[0,-1,0]) {
        cube([8,14,0.7], center=true);
    }
}

module latch() {
    translate([29.2,0,-1.53]){
        latch_down();
        translate([1.0,0,1]) {
            latch_up();
            translate([0.25,-6.5,0]) {
                cube([1.5, 13, 1]);
            }
        }
    }
}

module final_base() {
    difference() {
        drilled_base();
        lid_without_latch();
    }
}


//drilled_base();
lid();
//final_base();