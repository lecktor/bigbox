// Project: BigBox v2
// Part:    y_axis_drag_cap
// Author:  Grigori Palamartšuk <grigori.palamarchuk@gmail.com>
// Source:  http://bigbox.lecktor.ee

$e = 0.01;

module body()
{
    cube([26,31.5,5]);
    translate([0,0,5]) cube([2,30,9.5]);
    translate([18,0,5]) cube([8,30,9.5]);
    translate([0,30,5]) cube([26,1.5,9.5]);
    translate([5,0.75,5]) cube([10,3.5,2.5]);
}

module holes()
{
    translate([21.5,6.75,-$e]) cylinder(h=14.5+2*$e,r=1.75,$fn=30);
    translate([21.5,24.25,-$e]) cylinder(h=14.5+2*$e,r=1.75,$fn=30);
    
    translate([21.5,6.75,-$e]) cylinder(h=2.75+2*$e,r=3.0,$fn=30);
    translate([21.5,24.25,-$e]) cylinder(h=2.75+2*$e,r=3.0,$fn=30);
}

translate([-10,0,0])
difference()
{
    body();
    holes();
}