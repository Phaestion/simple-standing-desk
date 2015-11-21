bottomLegHeight= 700;
topLegHeight= 600;

topLegAdjust=300;

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

flat= false;
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
    translate([0,0,0])
    bottomLeg();
    
    translate([0,0,topLegAdjust])
    topLeg();
}

module bottomLeg()
{
    if (flat)
    {
       translate([boardThickness,0,0])
       rotate([0,90,0])
       rotate([0,0,90])
       color("red")            
       text(str(bottomLegWidthInside), size=25);
        
       translate([boardThickness,50,300])
       rotate([180,180,0])
       rotate([0,270,0])
       color("red")            
       text(str(bottomLegHeight), size=25);
       cube([boardThickness,bottomLegWidthInside,bottomLegHeight]);
        
       translate([boardThickness,100,0])
       rotate([0,90,0])
       rotate([0,0,90])
       color("red")            
       text(str(bottomLegWidthOutside), size=25);
        
       translate([boardThickness,140,300])
       rotate([180,180,0])
       rotate([0,270,0])
       color("red")            
       text(str(bottomLegHeight), size=25);
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
            
        translate([boardThickness,0,0])
        rotate([0,90,0])
        rotate([0,0,90])
        color("red")            
        text(str(topLegWidthOutside), size=25);
        
        translate([boardThickness,50,300])
        rotate([180,180,0])
        rotate([0,270,0])
        color("red")            
        text(str(topLegHeight), size=25);
        
        translate([0, 0, 0])
        cube([boardThickness,topLegWidthOutside,topLegHeight]);
        
        translate([boardThickness,100,0])
        rotate([0,90,0])
        rotate([0,0,90])
        color("red")            
        text(str(topLegWidthInside), size=25);
        
        translate([boardThickness,130,300])
        rotate([180,180,0])
        rotate([0,270,0])
        color("red")            
        text(str(topLegHeight), size=25);
        
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
      
               //top slats
        slatTopPos= bottomLegHeight - paddingGroove + (topLegAdjust - (bottomLegHeight - topLegHeight));
        
        a= tableTopWidth + flatpad;
        {
            translate([boardThickness,300,a])
            rotate([90,0,90])
            color("red")
            text(str(tableLegSpaceLength - 2*boardThickness), size=25);
            
            translate([boardThickness,0,a+40])
            rotate([0,90,0])
            color("red")
            text(str(paddingGroove/2), size=20);
            
            translate([0,0,a])
            cube([boardThickness, tableLegSpaceLength - 2*boardThickness, paddingGroove/2]);
        }
        
        b= a + paddingGroove/2 + flatpad;
        {
            translate([boardThickness,300,b])
            rotate([90,0,90])
            color("red")
            text(str( tableLegSpaceWidth - boardThickness*3), size=25);
            
            translate([boardThickness,0,b+40])
            rotate([0,90,0])
            color("red")
            text(str(paddingGroove/2), size=20);
            
            translate([0,0,b])
            cube([boardThickness, tableLegSpaceWidth - boardThickness*3, paddingGroove/2]);
        }
        
        c= tableLegSpaceWidth - boardThickness*3 + flatpad;
       {           
            translate([boardThickness,300 + c,b])
            rotate([90,0,90])
            color("red")
            text(str( tableLegSpaceWidth - boardThickness*3), size=25);
            
            translate([boardThickness,c,b+40])
            rotate([0,90,0])
            color("red")
            text(str(paddingGroove/2), size=20);
            
            translate([0,c,b])
           
            cube([boardThickness, tableLegSpaceWidth - boardThickness*3, paddingGroove/2]);
        }
        
        //bottom slats
        d= b + paddingGroove/2 + flatpad;
        {
            translate([boardThickness,300,d])
            rotate([90,0,90])
            color("red")
            text(str(tableLegSpaceLength+ 2*boardThickness), size=25);
            
            translate([boardThickness,0,d+40])
            rotate([0,90,0])
            color("red")
            text(str(paddingGroove/2), size=20);
            
            translate([0,0,d])
            cube([boardThickness, tableLegSpaceLength+ 2*boardThickness, paddingGroove/2]);
        }
        
        e= d + paddingGroove/2 + flatpad;
        {
            translate([boardThickness,300,e])
            rotate([90,0,90])
            color("red")
            text(str(tableLegSpaceLength+ 3*boardThickness), size=25);
            
            translate([boardThickness,0,e+40])
            rotate([0,90,0])
            color("red")
            text(str(paddingGroove/2), size=20);
            
            translate([0,0,e])
            cube([boardThickness, tableLegSpaceWidth + 3*boardThickness, paddingGroove/2]);
        }

        f= tableLegSpaceWidth + 3*boardThickness + flatpad;
        {
            translate([boardThickness,300 + f,e])
            rotate([90,0,90])
            color("red")
            text(str(tableLegSpaceLength+ 3*boardThickness), size=25);
            
            translate([boardThickness,f,e+40])
            rotate([0,90,0])
            color("red")
            text(str(paddingGroove/2), size=20);
            
            translate([0,f,e])
            cube([boardThickness, tableLegSpaceWidth + 3*boardThickness, paddingGroove/2]);
        }
    }
    else
    {
        //top slats
        slatTopPos= bottomLegHeight - paddingGroove + (topLegAdjust - (bottomLegHeight - topLegHeight));
        
        {
            translate([boardThickness,boardThickness, slatTopPos + paddingGroove/2])
            cube([boardThickness, tableLegSpaceLength - 2*boardThickness, paddingGroove/2]);
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
        
        //bottom slats
        {
            translate([- 2*boardThickness, -boardThickness, bottomLegHeight/2])
            cube([boardThickness, tableLegSpaceLength+ 2*boardThickness, paddingGroove/2]);
        }
        
        {
            translate([- 2*boardThickness,-boardThickness, bottomLegHeight/2])
            rotate([0,0,270])
            cube([boardThickness, tableLegSpaceWidth + 3*boardThickness, paddingGroove/2]);
        }

        
        {
            translate([- 2*boardThickness, tableLegSpaceLength + 2*boardThickness, bottomLegHeight/2])
            rotate([0,0,270])
            cube([boardThickness, tableLegSpaceWidth + 3*boardThickness, paddingGroove/2]);
        }
    }
}

module tableTop()
{
    if (flat)
    {          
       
        translate([boardThickness,100,0])
        rotate([90,0,90])
        color("red")
        text(str(tableTopLength), size=100);
        
        translate([boardThickness,0,500])
        rotate([0,90,0])
        color("red")
        text(str(tableTopWidth), size=100);
        
        cube([boardThickness,tableTopLength,tableTopWidth]);

        echo("Table top is: ", tableTopLength, " x ", tableTopWidth);
    }
    else
    {
        translate([(tableLegSpaceLength - tableTopLength)/2, (tableLegSpaceLength - tableTopLength)/2, bottomLegHeight  + boardThickness + (topLegAdjust - (bottomLegHeight - topLegHeight))])
        rotate([0,90,0])
    
        cube([boardThickness,tableTopLength,tableTopWidth]);
        
    }
}

module table()
{
    legs();  
    slats();
    tableTop();    
}

table();