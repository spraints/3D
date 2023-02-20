$fn = 120;

ball_diameter = 65;
shell_thickness = 5;
hole_diameter = 5;
shell_height = 20;

ball_r = ball_diameter / 2;
shell_r = ball_r + shell_thickness;
shell_diameter = shell_r * 2;

difference() {
    intersection() {
        sphere(shell_r);
        translate([0, 0, shell_diameter - shell_height]) cube(shell_diameter, true);
    }
    sphere(ball_r);
    cylinder(shell_r, hole_diameter, hole_diameter);
}