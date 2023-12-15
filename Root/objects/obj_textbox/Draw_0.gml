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
	for(var p = 0; p < page_number; p++)
		{
		
		//find how many characters are on each page and store number in the "text length" array
		text_length[p] = string_length(text[p]);
		
		//get the x position for the text box
			//character on center
			text_x_offset[p] = 800;
			portrait_x_offset[p] = 960;
			
			//character on the left
			if speaker_side[p] == -1{
				text_x_offset[p] = 480;
				portrait_x_offset[p] = 480;
			}
			//character on the right
			if speaker_side[p] == 1{
				text_x_offset[p] = 1440;
				portrait_x_offset[p] = 1440;
			}
			//if no char 
			if speaker_sprite[p] == noone {
				text_x_offset[p] = 480;
				}
			
			
		//if no character portrait (centers box in middle)
		text_x_offset[p] = 90;
		
		//setting individual characters and finding where the lines of the text should break
		for (var c = 0; c < text_length[p]; c++)
		{
		
		var _char_pos = c+1;
		
		//store individual characters in the "char" array
		char[c, p] = string_char_at(text[p], _char_pos);
		
		//get current width of the line
		var _txt_up_to_char = string_copy( text[p], 1, _char_pos );
		var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[c, p]);
		
		//get the last free space (plus one so next line won't start with a space)
		if char[c, p] == " " {last_free_space = _char_pos+1};
		
		//get the line breaks
		if _current_txt_w - line_break_offset[p] > line_width
		{
		//if line gets too long, instead of cutting mid word, line break from last empty space
		line_break_pos[ line_break_num[p] , p ] = last_free_space;
		//add 1 to total number of line breaks
		line_break_num[p]++;
		//get entire string up to the last free space
		var _txt_up_to_last_space = string_copy(text[p], 1, last_free_space );
		//getting string of last free space 
		var _last_free_space_string = string_char_at(text[p], last_free_space );
		//total string width after cutting away string after last free space
		line_break_offset[p] = string_width(_txt_up_to_last_space) - string_width(_last_free_space_string);
		}
		
	}
	
		//getting each characters coordinates
		 for (var c = 0; c < text_length[p]; c++)
		 {
 
		 var _char_pos = c + 1;
		 var _txt_x = text_x_offset[p] + border;
		 var _txt_y = border;
		 //get current width of the line
		 var _txt_up_to_char = string_copy( text[p], 1, _char_pos );
		 var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[c, p]);
		 //multiplier for y value
		 var _txt_line = 0;
 
		//compensate for string breaks
			for (var lb = 0; lb < line_break_num[p]; lb++)
			{
				//if the current looping character is after a line break
				if _char_pos >= line_break_pos[lb, p]
					{
					var _str_copy = string_copy(text[p], line_break_pos[lb, p], _char_pos-line_break_pos[lb, p]);
					_current_txt_w = string_width(_str_copy);
			
					//record the "line" this character should be on
					_txt_line = lb+1;//+1 since lb starts at 0
			
					}
			}
 
		//add to the x and y coordinate based on new info
		char_x[c, p] = _txt_x + _current_txt_w;
		char_y[c, p] = _txt_y + _txt_line*line_sep;
	 }
		
		
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
if accept_key && cool_down < 1
{
	cool_down = 15;
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
				//link text for options
				if option_number > 0 {
					create_textbox(option_link_id[option_pos]);
				}
			instance_destroy();
			global.playerControl = true;
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
var _txtb_x = textbox_x + text_x_offset[page];
var _txtb_y = textbox_y;
txtb_img += txtb_img_spd;
txtb_spr_w = sprite_get_width(txtb_spr[page]);
txtb_spr_h = sprite_get_height(txtb_spr[page]);
//draw the speaker
if speaker_sprite[page] != noone
	{
	sprite_index = speaker_sprite[page];
	if draw_char == text_length[page] {image_index = 0};
	var _speaker_x = textbox_x + portrait_x_offset[page];
	//if speaker_side[page] == -1 {_speaker_x += sprite_width};
	//draw the speaker
	//draw_sprite_ext(txtb_spr[page], txtb_img,  camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - sprite_width/2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 - sprite_height/2, sprite_width/txtb_spr_w, sprite_height/txtb_spr_h, 0, c_white, 1);
	//draw_sprite_ext(txtb_spr[page], txtb_img, textbox_x + portrait_x_offset[page], textbox_y, sprite_width/txtb_spr_w, sprite_height/txtb_spr_h, 0, c_white, 1);
	//draw_sprite_ext(sprite_index, image_index, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - sprite_width/2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 - sprite_height/2, speaker_side[page], 1, 0, c_white, 1);
	draw_sprite_ext(sprite_index, image_index, camera_get_view_x(view_camera[0]) + portrait_x_offset[page], textbox_y, 1, 1, 0, c_white, 1);
	}


//back of the textbox
draw_sprite_ext(txtb_spr[page], txtb_img, _txtb_x, _txtb_y, textbox_width/txtb_spr_w, textbox_height/txtb_spr_h, 0, c_white, 1);

//draw the text
for(var c = 0; c < draw_char; c++)
{
//the text
draw_text(textbox_x + char_x[c, page], textbox_y + char_y[c, page], char[c, page]);
}
//var _drawtext = string_copy(text[page], 1, round(draw_char));
//draw_text_ext(textbox_x + text_x_offset[page] + border, textbox_y + border, _drawtext, line_sep, line_width);

//------------------------options----------------------//
if draw_char == text_length[page] && page == page_number - 1
{
	//option selection arrow
	dialogue_active = true;
	
	//drawing the options
	//Vertical space between the options
	var _op_space = 100;
	//space between text and textbox
	var _op_bord = 40;
	//options distance from the left
	var _op_left_offset = 85;
	
	for (var op = 0; op < option_number; op++)
	{
	//the option box
	var _o_w = string_width(option[op]) + _op_bord*2
	//position of text box               distance from the left   calc new option position
	draw_sprite_ext(txtb_spr[page], txtb_img, _txtb_x + _op_left_offset, (_txtb_y - _op_space*option_number + _op_space*op), _o_w/txtb_spr_w, (_op_space-10)/txtb_spr_h, 0, c_white, 1)
	
	//write option text
	draw_text(_txtb_x + _op_left_offset + _op_bord, _txtb_y - _op_space*option_number + 20 + _op_space*op, option[op]);
	
	//turn the selected option yellow
	var _c = c_white;
	 if option_pos == op{_c = c_yellow}
	 draw_text_transformed_color(_txtb_x + _op_left_offset + _op_bord, _txtb_y - _op_space*option_number + 20 + _op_space*op, option[op], 1, 1, 0, _c, _c, _c, _c, 1);
	
	//Draw the selection arrow
	if option_pos == op
	{
	draw_sprite(spr_selection_arrow, 0, _txtb_x, _txtb_y - _op_space*option_number + _op_space*op + 10);
	}
	
	}
	

}