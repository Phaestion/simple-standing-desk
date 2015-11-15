bottomLegHeight= 700;
topLegHeight= 600;

topLegAdjust=300;
bottomLegAdjust=0;

groove=10;
paddingGroove=100;

boardThickness=18;

tableLegSpaceWidth=800;
tableLegSpaceLength=1400;
tabelTopOverhang= 50*2;

tableTopWidth= tableLegSpaceWidth  + tabelTopOverhang;
tableTopLength= tableLegSpaceLength  + tabelTopOverhang;

bottomLegWidthInside=80;
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
    difference()
    {
        cube([boardThickness,bottomLegWidthInside,bottomLegHeight]);
        translate([0,bottomLegWidthInside/2 - groove/2 + boardThickness/2,paddingGroove/2])
        cube([boardThickness,groove,bottomLegHeight - paddingGroove]);        
    }

    translate([boardThickness,-boardThickness,0])
    rotate([0,0,90])
     difference()
    {
        cube([boardThickness,bottomLegWidthOutside,bottomLegHeight]);
        translate([0,bottomLegWidthInside/2 - groove/2 + boardThickness,paddingGroove/2])
        cube([boardThickness,groove,bottomLegHeight - paddingGroove]);        
    }
}

module topLeg()
{
    translate([0, 0, 0])
    rotate([0,0,90])
    difference()
    {
        cube([boardThickness,topLegWidthOutside,topLegHeight]);
        translate([0,topLegWidthInside/2 - groove/2 + boardThickness/2,paddingGroove/2])
        cube([boardThickness,groove,topLegHeight - paddingGroove]);
    }
    
    translate([-boardThickness, boardThickness, 0])
    difference()
    {
        cube([boardThickness,topLegWidthInside,topLegHeight]);    
        translate([0,topLegWidthInside/2 - groove/2,paddingGroove/2])
        cube([boardThickness,groove,topLegHeight - paddingGroove]);
    }
}






module tableTop()
{
    translate([(tableLegSpaceLength - tableTopLength)/2, (tableLegSpaceLength - tableTopLength)/2, bottomLegHeight  + boardThickness + (topLegAdjust - (bottomLegHeight - topLegHeight))])
    rotate([0,90,0])
    difference()
    {
        cube([boardThickness,tableTopLength,tableTopWidth]);
    }
}

legPos(x=0, y=0, z=0, rt=270);
legPos(x=tableLegSpaceWidth, y=0, z=0, rt=0);
legPos(x=0, y=tableLegSpaceLength, z=0, rt=180);
legPos(x=tableLegSpaceWidth, y=tableLegSpaceLength, z=0, rt=90);
tableTop();