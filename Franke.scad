// Project: FRANKE CAD 
// Author : Marc Amil 
// Company: Mycrobez 
// Date: 09.03.2021

// Things needed to find out:


//////////// Parameters/////////////////
// 1 unit = 1 mm
$fn = 70; 

//Backwall parameters 
backwall_height = 75;
backwall_width = 600;
backwall_depth = 35;

//Sidewall parameters 
sidewall_height = 75;
sidewall_width = 120;
sidewall_depth = 50; 

// Support sidewall parameters 
support_sw_height = 20;
support_sw_width = 120;
support_sw_depth = 27;

// Middle blok parameters 
middle_block_height = 52;
middle_block_width = 180;
middle_block_depth = 20;


//pimple and dimple parameters 
pimple_height = 30;
pimple_radius = 15;



///////RENDERS?////////////
 wall();

mirror([1,0,0]) {
difference() {
translate([-299.5, - 102.5, -37.5])
sidewall();
translate([-325,-20, -38])
    pimple();
    }
}



translate([0,-25,11]) {
    middleblock();
}



translate([-325,-20, 35])
    pimple();
mirror([1,0,0]) {
translate([-325,-20, 35])
    pimple();
}


 ///////////Modules////////////////////
 module semicircle() {
     difference(){
  cylinder(r=1, h=60);
     translate([0,1,30])
     cube([4,3,100], center = true);
}
}

module wall() {
    union() {
backwall();
difference() {
translate([-299.5, - 102.5, -37.5])
sidewall();
translate([-325,-20, -38])
    pimple();
        }
 }
}


 module backwall() {
     cube([backwall_width, backwall_depth, backwall_height], center = true);
 }
 
 module sidewall() {
 union(){
    rotate([0,0 ,90]) {
     cube([sidewall_width, sidewall_depth, sidewall_height]);
  translate([0,-25 ,0])
    cube([support_sw_width, support_sw_depth, support_sw_height]); 
    }
 }
}

module middleblock() {
    cube([middle_block_width, middle_block_depth, middle_block_height], center = true );
}


module pimple() {
    cylinder(h = pimple_height , r = pimple_radius);
}



