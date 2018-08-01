// Project: BigBox v2
// Part:    y_axis_bearing_retainer (x2)
// Author:  Grigori Palamartšuk <grigori.palamarchuk@gmail.com>
// Source:  http://bigbox.lecktor.ee

module body()
{
    cylinder(h=3,r=10.5,$fn=90);
    cube([10.5,10.5,3]);
    translate([-10.5,-10.5,0]) cube([10.5,10.5,3]);
}

module holes()
{
    // bearing hole
    cylinder(h=3,r=5.5,$fn=60);
    
    // screw holes
    translate([7.5,7.5,0]) cylinder(h=3,r=1.725,$fn=30);
    translate([-7.5,-7.5,0]) cylinder(h=3,r=1.725,$fn=30);
    
    // edge angle cutouts
    translate([10,10.5,3])
        rotate([0,90,-90])
            edge_cutout();
    
    translate([-10,-10.5,3])
        rotate([0,90,90])
            edge_cutout();
}

module edge_cutout()
{
    polyhedron(
        points=[
            [0,0,0],[3,0,0],[3,0.5,0],
            [0,0.5,0],[0,0.5,0.5],[3,0.5,0.5]
        ],
        faces=[
            [0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]
        ]
    );
}

difference()
{
    body();
    holes();
}