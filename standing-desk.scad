bottomLegHeight= 700;
topLegHeight= 600;

topLegAdjust=300;
bottomLegAdjust=0;

boardThickness=18;

bottomLegWidthInside=50;
bottomLegWidthOutside= bottomLegWidthInside + boardThickness;

topLegWidthInside= bottomLegWidthInside - boardThickness;
topLegWidthOutside= bottomLegWidthInside;


module legPos(x,y,z,rt)
{
    translate([x,y,z])
    rotate([0,0,rt])    
    leg();
}
module leg()
{
    translate([0,0,bottomLegAdjust])
    bottomLeg();
    
    translate([0,0,topLegAdjust])
    topLeg();
}

module bottomLeg()
{
    cube([boardThickness,bottomLegWidthInside,bottomLegHeight]);

    translate([boardThickness,-boardThickness,0])
    rotate([0,0,90])
    cube([boardThickness,bottomLegWidthOutside,bottomLegHeight]);
}

module topLeg()
{
    translate([-boardThickness, 0, 0])
    rotate([0,0,90])
    cube([boardThickness,topLegWidthInside,topLegHeight]);
    
    translate([-boardThickness, 0, 0])
    cube([boardThickness,topLegWidthOutside,topLegHeight]);
}



legPos(x=0, y=0, z=0, rt=270);
legPos(x=200, y=0, z=0, rt=0);
legPos(x=0, y=200, z=0, rt=180);
legPos(x=200, y=200, z=0, rt=90);