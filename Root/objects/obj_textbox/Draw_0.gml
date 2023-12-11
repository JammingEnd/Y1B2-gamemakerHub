/// @description Insert description here
// key to proceed
accept_key = keyboard_check_pressed(vk_space);

textbox_x = camera_get_view_x(view_camera[0]);
textbox_y = camera_get_view_y(view_camera[0]) + 718;

//setup
if setup == false
	{
		
	setup = true;
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	//loop through the pages
	page_number = array_length(text);
	for(var p = 0; p < page_number; p++)
		{
		
		//find how many characters are on each page and store number in the "text length" array
		text_length[p] = string_length(text[p]);
		
		//get the x position for the text box
			//if no character portrait (centers box in middle)
		text_x_offset[p] = 90;
		
		}
	
	}


 
//typing the text
if draw_char < text_length[page]
{
	draw_char += text_spd;
	//sets min & max value for draw_char speed
	draw_char = clamp(draw_char, 0, text_length[page]);
}

//flip through pages untill done
if accept_key
{

//if typing is done
if draw_char == text_length[page]
	{
		
	//next page
	if page < page_number - 1
		{
		page++;
		draw_char = 0;
		}
		//destroy textbox 
		else
		{
		instance_destroy();
		}
	}
	//if not done typing
	else
	{
		//draw the rest of text instantly
		draw_char = text_length[page];
	}
}

//----------------draw the text box----------------
txtb_img += txtb_img_spd;
txtb_spr_w = sprite_get_width(txtb_spr);
txtb_spr_h = sprite_get_height(txtb_spr);
//back of the textbox
draw_sprite_ext(txtb_spr, txtb_img, textbox_x + text_x_offset[page],textbox_y, textbox_width/txtb_spr_w, textbox_height/txtb_spr_h, 0, c_white, 1);


//draw the text
var _drawtext = string_copy(text[page], 1, round(draw_char));
draw_text_ext(textbox_x + text_x_offset[page] + border, textbox_y + border, _drawtext, line_sep, line_width);

