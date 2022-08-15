include <NopSCADlib/utils/core/core.scad>
include <NopSCADlib/utils/layout.scad>
include <NopSCADlib/vitamins/extrusions.scad>
include <NopSCADlib/vitamins/rails.scad>

  
 base_A_length=500;
 base_B_length=1400;
 base_C_length=500;
 column_height=1400;
 foam_thickness=50;

//顶盖
translate([0,10,column_height-40+10]){
//间隔和旋转轴
cover(70,0,0,0);
}

 
//基座
 //base_A
 for(i=[[0,0,0],[0,0,column_height+20]])
 translate(i){
 translate([10,20,10])
 rotate([270,0,0])
 color("black")
 extrusion(E2020,  base_A_length, center = false, cornerHole = false);}
 
   translate([10,10+base_A_length,20])
 rotate([0,0,0])
 color("green")
 extrusion(E2020,  column_height, center = false, cornerHole = false);
 
 //base_B
  for(i=[[0,0,0],[0,0,column_height+20]])
 translate(i){
 translate([0,10,10])
 rotate([0,90,0])
 color("red")
 extrusion(E2020,  base_B_length, center = false, cornerHole = false);}
 
  translate([10,10,20])
 rotate([0,0,0])
 color("green")
 extrusion(E2020,  column_height, center = false, cornerHole = false);
 
   translate([10+base_B_length-20,10,20])
 rotate([0,0,0])
 color("green")
 extrusion(E2020,  column_height, center = false, cornerHole = false);
 
 
  //base_C
  for(i=[[0,0,0],[0,0,column_height+20]])
 translate(i){
 translate([10+base_B_length-20,20,10])
 rotate([270,0,0])
 color("black")
 extrusion(E2020,  base_C_length, center = false, cornerHole = false);}
 
   translate([10+base_B_length-20,10+base_C_length,20])
 rotate([0,0,0])
 color("green")
 extrusion(E2020,  column_height, center = false, cornerHole = false);
 
 
  //door_A
     translate([0,base_A_length+20,0]){
         rotate([0,0,0])
 door_a();}
 module door_a(){
     
     translate([0,-base_A_length-20,0]){
  for(i=[[0,0,0],[0,0,column_height+20]])
 translate(i){
 translate([-10*cos(45)+20/cos(45),20+base_A_length+10*cos(45),10])
 rotate([270,0,-45])
 color("gray"){
 extrusion(E2020,  base_B_length*cos(45)-40, center = false, cornerHole = false);
     translate([-10,0,-20])
    rotate([0,-45,0])
     extrusion_wedge_down(E2020,20);}
     }
     
translate([30,10+base_A_length+30,20])
 rotate([0,0,45])
 {
 extrusion(E2020,  column_height, center = false, cornerHole = false);
     rotate([0,0,-90])
     translate([0,base_B_length*cos(45)-60-10*cos(45),0])
      extrusion(E2020,  column_height, center = false, cornerHole = false);
     }
 }
 }
 
 
   //door_B
     translate([base_B_length,base_A_length+20,0]){
     rotate([0,0,0])
  door_b();}
     
     module door_b(){
         translate([-base_B_length,-base_A_length-20,0]){
  for(i=[[0,0,0],[0,0,column_height+20]])
 translate(i){
 translate([base_B_length-10*cos(45)-20/cos(45),base_A_length+20-10*cos(45),10])
 rotate([270,0,45])
 translate([20,0,0])
 color("red"){
 extrusion(E2020,  base_B_length*cos(45)-20, center = false, cornerHole = false);
         translate([-10,0,0])
    rotate([0,45+90,0])
     extrusion_wedge_up(E2020,20);
     }}
 
 translate([base_B_length-20-20*cos(45),10+base_A_length+30,20])
 rotate([0,0,45]){
 extrusion(E2020,  column_height, center = false, cornerHole = false);
          rotate([0,0,0])
     translate([0,base_B_length*cos(45)-60-10*cos(45)+20,0])
      extrusion(E2020,  column_height, center = false, cornerHole = false);
     
     }
 }
     }
     
 

  
 //铝型材的楔子切口-下方的

module  extrusion_wedge_down(extrusion_specs,extrusion_specs_offset){
   
 difference(){
translate([(extrusion_specs_offset/2)*cos(45),0,-(extrusion_specs_offset/2)*cos(45)]){
rotate([0,45,0]){
extrusion(extrusion_specs,extrusion_specs_offset,center=false,cornerHole=true);}}

translate([-2*extrusion_specs_offset,-extrusion_specs_offset,-extrusion_specs_offset*cos(45)]){
cube([4*extrusion_specs_offset,2*extrusion_specs_offset,extrusion_specs_offset*cos(45)]);}

}

}

//铝型材的楔子，上方的
module  extrusion_wedge_up(extrusion_specs,extrusion_specs_offset){
  difference(){
translate([-(extrusion_specs_offset/2)*cos(45)+eps,0,(extrusion_specs_offset/2)*cos(45)+eps]){
rotate([0,45,0]){
extrusion(extrusion_specs,extrusion_specs_offset-eps,center=false,cornerHole=true);}}

translate([0,-extrusion_specs_offset+eps,0]){
cube([2*extrusion_specs_offset*cos(45)+eps,2*extrusion_specs_offset,2*extrusion_specs_offset/cos(45)]);
    
    }

}}


//顶盖
// for(i=[[0,0,column_height+x]])


module cover(x,i,j,k){
    rotate([i,j,k]){
//base_A
 for(i=[[0,-10,x]])
 translate(i){
 translate([10,20,10])
 rotate([270,0,0])
 color("black")
 extrusion(E2020,  base_A_length, center = false, cornerHole = false);}
 
 
 //base_B
 for(i=[[0,-10,x]])
 translate(i){
 translate([0,10,10])
 rotate([0,90,0])
 color("red")
 extrusion(E2020,  base_B_length, center = false, cornerHole = false);}
 
 
  //base_C
 for(i=[[0,-10,x]])
 translate(i){
 translate([10+base_B_length-20,20,10])
 rotate([270,0,0])
 color("black")
 extrusion(E2020,  base_C_length, center = false, cornerHole = false);}
 

 
 
  //door_A
 for(i=[[0,-10,x]])
 translate(i){
 translate([-10*cos(45)+20/cos(45),20+base_A_length+10*cos(45),10])
 rotate([270,0,-45])
 color("gray"){
 extrusion(E2020,  base_B_length*cos(45)-40, center = false, cornerHole = false);
     translate([-10,0,-20])
    rotate([0,-45,0])
     extrusion_wedge_down(E2020,20);}
     }
     

 
 
 
   //door_B
 for(i=[[0,-10,x]])
 translate(i){
 translate([base_B_length-10*cos(45)-20/cos(45),base_A_length+20-10*cos(45),10])
 rotate([270,0,45])
 translate([20,0,0])
 color("red"){
 extrusion(E2020,  base_B_length*cos(45)-20, center = false, cornerHole = false);
         translate([-10,0,0])
    rotate([0,45+90,0])
     extrusion_wedge_up(E2020,20);
     }}
     
     //L-左侧
     translate([10,0,x-100]){
    translate([-10-4,-10,100])
    color("red")
     L_angle(120);
         }
         
      //L-右侧
      
     translate([base_B_length-10,0,x-100]){
        translate([10+6,-10,100])
    color("red")
     L_angle(120);}    
     
 }
 
 //顶盖-左侧滑轮
translate([10,0,x-100]){
rotate([0,0,270])
import("v-slot-gantry.stl",convexity=3);}

//顶盖-右侧滑轮
translate([base_B_length-10,0,x-100]){
rotate([0,0,90])
import("v-slot-gantry.stl",convexity=3);}
 }
 
 
 //L型支架
 module L_angle(x){
 translate([-2,0,0])
 cube([2,x,20]);
 rotate([270,0,0])
 translate([-2,0,0])
 cube([2,x-20,20]);}
 
 
 //mount
 translate([base_B_length/2,430+20,0])
 for( i=[[0,0,0],[0,0,120],[0,0,240]]){
 rotate(i)
 translate([0,-25,0])
          color("gray",0.5)
 cube([430,50,50]);
 }
 
 //泡沫板B
 translate([20,20,0])
foam(base_B_length-40, foam_thickness,column_height+20+20+20);
 
 //泡沫板A 
  translate([foam_thickness+20,foam_thickness+20,0])
 rotate([0,0,90])
foam(base_A_length-foam_thickness, foam_thickness,column_height+20+20+20);
 
  //泡沫板C
   translate([base_B_length-20,foam_thickness+20,0])
 rotate([0,0,90])
foam(base_A_length-foam_thickness, foam_thickness,column_height+20+20+20);
 
 module foam(x,y,z){
     color("black",0.8)
     cube([x,y,z]);
     }