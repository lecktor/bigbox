// Project: BigBox v2
// Part:    z_axis_guide_bottom_cap (x4)
// Author:  Grigori Palamartšuk <grigori.palamarchuk@gmail.com>
// Source:  http://bigbox.lecktor.ee

module body()
{
    cylinder(h=2.5,r=13,$fn=90);
    translate([0,0,2.5]) cylinder(h=2.25,r=8,$fn=90);
}

module holes()
{    
    // screw holes
    translate([8.485,0,0]) cylinder(h=4.75,r=1.725,$fn=30);
    translate([-8.485,0,0]) cylinder(h=4.75,r=1.725,$fn=30);
}

difference()
{
    body();
    holes();
}
