/// @description Insert description here
// You can write your code in this editor

if (global.current_enemy_count) <= 0{timer++} else{timer=0};

if (timer >= 120){

if instance_exists(obj_player)
dir = point_direction(x, y, obj_player.x, obj_player.y);

// get the correct face
 if dir > 90 && dir < 270
 {
 face =  -1;
 }else{face = 1;}
 
 
 xspd = lengthdir_x(spd, dir);
 yspd = lengthdir_y(spd, dir);
 
 //moving
x += xspd;
y += yspd;
}






