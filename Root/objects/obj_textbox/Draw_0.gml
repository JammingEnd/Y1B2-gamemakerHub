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
txtb_spr_w = sprite_get_width(txtb_spr);
txtb_spr_h = sprite_get_height(txtb_spr);
//back of the textbox
draw_sprite_ext(txtb_spr, txtb_img, _txtb_x, _txtb_y, textbox_width/txtb_spr_w, textbox_height/txtb_spr_h, 0, c_white, 1);


//draw the text
var _drawtext = string_copy(text[page], 1, round(draw_char));
draw_text_ext(textbox_x + text_x_offset[page] + border, textbox_y + border, _drawtext, line_sep, line_width);

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
	draw_sprite_ext(txtb_spr, txtb_img, _txtb_x + _op_left_offset, (_txtb_y - _op_space*option_number + _op_space*op), _o_w/txtb_spr_w, (_op_space-10)/txtb_spr_h, 0, c_white, 1)
	
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