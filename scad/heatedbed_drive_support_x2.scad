// Project: BigBox v2
// Part:    heatedbed_drive_support (x2)
// Author:  Grigori Palamartšuk <grigori.palamarchuk@gmail.com>
// Source:  http://bigbox.lecktor.ee

$e  = 0.01;
$h  = 23.25;
$pl = 6.2;

module body()
{
    difference()
    {
        difference()
        {
            translate([$e,$e,0]) cube([35-2*$e,50.50-2*$e,23.25]);
            union()
            {
                translate([0,50.50-4.5,0]) cylEdge(4.5,1);
                translate([35,50.50-4.5,0]) cylEdge(4.5,2);
            }
        }
        union()
        {
            translate([25,20,0]) cylEdge(10,3);
            translate([10,20,0]) cylEdge(10,4);
        }
    }
}

module holes()
{
    // central hole
    translate([17.5,35.5,-$e]) cylinder(h=$h+2*$e,r=13,$fn=90);
    translate([4.5-$e,35.5,-$e]) cube([26+2*$e,15+$e,$h+2*$e]);
    
    // m3 screw hole
    translate([17.5,16.5,-$e]) cylinder(h=$h+2*$e,r=1.75,$fn=30);
    
    // plywood holder hole
    translate([(35-$pl)/2,0,-$e]) cube([$pl,10,$h+2*$e]);
    
    // corner cutouts
    translate([0,0,-$e]) cube([10,10+2*$e,$h+2*$e]);
    translate([25,0,-$e]) cube([10,10+2*$e,$h+2*$e]);
}


module cylEdge(rr=2.25,pos=1)
{
    difference()
    {

        difference()
        {
            translate([-rr,-rr,-$e]) cube([2*rr,2*rr,$h+2*$e]);
            cylinder(h=$h,r=rr,$fn=90);
        }
        union()
        {
            if (pos == 1) // top_right
            {
                translate([-rr,0,0]) cube([rr,rr,$h]);
                translate([-rr,-rr,0]) cube([rr,rr,$h]);
                translate([0,-rr,0]) cube([rr,rr,$h]);
            } else if (pos == 2) { // top_left
                translate([0,0,0]) cube([rr,rr,$h]);
                translate([-rr,-rr,0]) cube([rr,rr,$h]);
                translate([0,-rr,0]) cube([rr,rr,$h]);
            } else if (pos == 3) { // bottom_right
                translate([0,0,0]) cube([rr,rr,$h]);
                translate([-rr,0,0]) cube([rr,rr,$h]);
                translate([-rr,-rr,0]) cube([rr,rr,$h]);                
            } else if (pos == 4) { // bottom_left
                translate([0,0,0]) cube([rr,rr,$h]);
                translate([-rr,0,0]) cube([rr,rr,$h]);
                translate([0,-rr,0]) cube([rr,rr,$h]);
            } else {
                // nothing
            }
        }
    }
}

translate([-17.5,0,0])
difference()
{
    body();
    holes();
}