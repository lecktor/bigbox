// Project: BigBox v2
// Part:    y_axis_cable_conduit (x3)
// Author:  Grigori Palamartšuk <grigori.palamarchuk@gmail.com>
// Source:  http://bigbox.lecktor.ee

// plywood thickness
$pl = 6.2;

module body()
{
    cube([23.10,18,10]);
    translate([2.725,18,0]) cube([4,$pl,10]);
}

module holes()
{
    // screw hole (attachment to frame)
    translate([18,18,5])
        rotate([90,0,0])
            cylinder(h=18,r=1.75,$fn=30);
    
    // m3 nut trap (din934)
    translate([18,2.4,5])
        rotate([90,0,0]) cylinder(r=2.75/cos(30)+0.05,h=2.4,$fn=6);
    
    // hole for cables
    translate([4.55,3,0]) cube([10,10,10]);
}

difference()
{
    body();
    holes();
}
