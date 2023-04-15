$fn = 10;

use <roundedcube.scad>

// all sizes are in mm

// shaft is the metal piece going all the way from one end to the other.
shaft_diameter = 2.5;
// disk_diameter is the part of the disk that sticks out towards the reset key,
// which we want to keep from moving down the shaft.
disk_diameter = 4.9;
// gap is how much space there is between the reset key and the last wheel.
// there's a spring on the shaft that probably is supposed to keep the wheels
// from traveling down the shaft, but it's not that functional anymore.
gap = 1.3;

// narrowest width of support for key.
bridge_w = 17;
bridge_d = 3;

// outer dimensions of the rectangular bushing.
height = 10;
width = 20;
// opening width and depth.
opening = 3;
depth = 6;

translate([1,0,0])
rotate([0,90,0])
linear_extrude(height = depth-1)
polygon(points = [[0,0],[3,0],[0,3]]);

translate([depth, width, 0])
rotate([0,90,180])
linear_extrude(height = depth-1)
polygon(points = [[0,0],[3,0],[0,3]]);

difference() {
    // outline of bushing.
    roundedcube([height, width, gap], false, 1, "all");

    // hole for shaft.
    translate([depth-opening/2,width/2,0]) cylinder(h = 40, d = opening, center = true);

    // slot to fit the shaft through.
    translate([-opening/2,(width-opening)/2,-10]) cube([depth,opening,20], false);
}
