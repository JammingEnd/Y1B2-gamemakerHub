/// @description Draw textbox

// Draw textbox
draw_self();

// Draw Text
draw_set_font(fnt_basic_font);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_ext_color(x,y,textToShow,lineHeight,textWidth,c_white,c_white,c_white,c_white,image_alpha);