// Project: BigBox v2
// Part:    z_axis_guide_top_lower (x4)
// Author:  Grigori Palamartšuk <grigori.palamarchuk@gmail.com>
// Source:  http://bigbox.lecktor.ee

module body()
{
    cube([34,13,4.5]);
    difference() {
        translate([17,13,0]) cylinder(h=4.5,r=17,$fn=90);
        translate([0,-4,0]) cube([34,4,4.5]);
    }
}

module holes()
{
    // central hole
    translate([17,13,0]) cylinder(h=4.5,r=8.5,$fn=90);
    
    // m3 screw holes
    translate([5.5,13,0]) cylinder(h=4.5,r=1.75,$fn=30);
    translate([28.5,13,0]) cylinder(h=4.5,r=1.75,$fn=30);
    
    // m3 nut trap (din934)
    translate([5.5,13,2.1]) cylinder(r=2.75/cos(30)+0.05,h=2.4,$fn=6);
    translate([28.5,13,2.1]) cylinder(r=2.75/cos(30)+0.05,h=2.4,$fn=6);
}

translate([-17,-13,0])
difference()
{
    body();
    holes();
}