boxWidth = sprite_get_width(Spr_RedBox);
str_height = string_height(DisplayText);


draw_set_font(BasicFont);
draw_text_ext(x, y, DisplayText, str_height, boxWidth);
instance_deactivate_object(Obj_TextDisplay);


