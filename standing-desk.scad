bottomLegHeight= 700;
topLegHeight= 600;

topLegAdjust=400;

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

flat= true;
flatpad= 10;

module legs()
{
    if (flat)
    {
        a= tableTopWidth + 4*paddingGroove +4*flatpad;
        translate([0, 0, a])
        rotate([270,0,0])
        bottomLeg();
        
        b= bottomLegHeight + flatpad;
        translate([0, b, a])
        rotate([270,0,0])
        bottomLeg();
        
         c= a + bottomLegWidthOutside + bottomLegWidthOutside;
        translate([0, 0, c])
        rotate([270,0,0])
        bottomLeg();
        
        translate([0, b, c])
        rotate([270,0,0])
        bottomLeg();
       
        d= c + topLegWidthInside + topLegWidthOutside + flatpad*2;
        translate([0, 0, d])
        rotate([270,0,0])
        topLeg();
        
        e= d + topLegWidthInside + topLegWidthOutside + flatpad*2;
        translate([0, 0, e])
        rotate([270,0,0])
        topLeg();
        
        f= topLegHeight + flatpad;
        translate([0, f, d])
        rotate([270,0,0])
        topLeg();
        
        
        translate([0, f, e])
        rotate([270,0,0])
        topLeg();
        
           
    }
    else
    {
        legPos(x=0, y=0, z=0, rt=270);
        legPos(x=tableLegSpaceWidth, y=0, z=0, rt=0);
        legPos(x=0, y=tableLegSpaceLength, z=0, rt=180);
        legPos(x=tableLegSpaceWidth, y=tableLegSpaceLength, z=0, rt=90);
    }
}

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
    if (flat)
    {
       cube([boardThickness,bottomLegWidthInside,bottomLegHeight]);
        
       translate([0,bottomLegWidthInside + flatpad, 0])
       cube([boardThickness,bottomLegWidthOutside,bottomLegHeight]);
    }
    else
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
}

module topLeg()
{
    if (flat)
    {       
        translate([0, 0, 0])
        cube([boardThickness,topLegWidthOutside,topLegHeight]);
        
        b= topLegWidthOutside + flatpad;
        translate([0, b, 0])
        cube([boardThickness,topLegWidthInside,topLegHeight]);           
    }
    else
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
    
}

module slats()
{
    if (flat)
    {
        i= tableTopWidth + flatpad;
        {
            translate([0,0,i])     
        cube([boardThickness,tableLegSpaceLength - 2*boardThickness, paddingGroove/2]);
        }
        j= i + paddingGroove/2 + flatpad;
        {
            translate([0,0, j])
            cube([boardThickness, tableLegSpaceLength, paddingGroove/2]);
        }
        k= j + paddingGroove/2 + flatpad;
        
        {
            translate([0,0, k])
                cube([boardThickness, tableLegSpaceWidth - boardThickness, paddingGroove/2]);
        }
        
        l= tableLegSpaceWidth - boardThickness + flatpad;
        
        {
            translate([0, n,m])
            cube([boardThickness, tableLegSpaceWidth - boardThickness, paddingGroove/2]);
        }
        
        m= k + paddingGroove/2 + flatpad;
        {
            translate([0, 0,m])
            cube([boardThickness, tableLegSpaceWidth - boardThickness*3, paddingGroove/2]);
        }
        
        n= tableLegSpaceWidth - boardThickness*3 + flatpad;
        {
            translate([0, l,k])
            cube([boardThickness, tableLegSpaceWidth - boardThickness*3, paddingGroove/2]);
        }
    }
    else
    {
        slatTopPos= bottomLegHeight - paddingGroove + (topLegAdjust - (bottomLegHeight - topLegHeight));
        
        {
            translate([boardThickness,boardThickness, slatTopPos + paddingGroove/2])
            cube([boardThickness, tableLegSpaceLength - 2*boardThickness, paddingGroove/2]);
        }
        
        {
            translate([0,0, 0])
            cube([boardThickness, tableLegSpaceLength, paddingGroove/2]);
        }
        
        {
            translate([boardThickness,boardThickness, 0])
            rotate([0,0,270])
            cube([boardThickness, tableLegSpaceWidth - boardThickness, paddingGroove/2]);
        }

        {
            translate([boardThickness, tableLegSpaceLength, 0])
            rotate([0,0,270])
            cube([boardThickness, tableLegSpaceWidth - boardThickness, paddingGroove/2]);
        }
        
        
        {
            translate([boardThickness*2,boardThickness*2, slatTopPos + paddingGroove/2])
            rotate([0,0,270])
            cube([boardThickness, tableLegSpaceWidth - boardThickness*3, paddingGroove/2]);
        }

        
        {
            translate([boardThickness*2, tableLegSpaceLength - boardThickness, slatTopPos + paddingGroove/2])
            rotate([0,0,270])
            cube([boardThickness, tableLegSpaceWidth - boardThickness*3, paddingGroove/2]);
        }
    }
}

module tableTop()
{
    if (flat)
    {
        cube([boardThickness,tableTopLength,tableTopWidth]);
        echo("Table top is: ", tableTopLength, " x ", tableTopWidth);
    }
    else
    {
        translate([(tableLegSpaceLength - tableTopLength)/2, (tableLegSpaceLength - tableTopLength)/2, bottomLegHeight  + boardThickness + (topLegAdjust - (bottomLegHeight - topLegHeight))])
        rotate([0,90,0])
        difference()
        {
            cube([boardThickness,tableTopLength,tableTopWidth]);
        }
    }
}

module table()
{
    legs();  
    slats();
    tableTop();    
}

table();
