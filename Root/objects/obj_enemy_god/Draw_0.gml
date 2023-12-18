/// @description Insert description here
draw_sprite_ext( sprite_index, image_index, x, y, face, image_yscale, image_angle, c_white, image_alpha);

//draw hp
draw_text (x, y, "hp:" + string(hp));

//check the size of the damage list
draw_text(x, y - 210, string(ds_list_size(damageList)))




