//store where in body text it should move onto next line
function scr_set_defaults_for_text(){
	line_break_pos[0, page_number] = 999;
	//tracks number of line breaks
	line_break_num[page_number] = 0;
	//keep track width of pixels to reset each character's x position 
	//(measure length of first broken line of text to measure next line break)
	line_break_offset[page_number] = 0;
	//variable for every letter/character
	for (var c = 0; c < 500; c++)
		{
		col_1[c, page_number] = c_white;
		col_2[c, page_number] = c_white;
		col_3[c, page_number] = c_white;
		col_4[c, page_number] = c_white;
		
		float_text[c, page_number] = 0;
		float_dir[c, page_number] = c*20;
		float_strength[c, page_number] = 2;
		float_speed[c, page_number] = 1;
		
		shake_text[c, page_number] = 0;
		shake_dir[c, page_number] = irandom(360);
		shake_timer[c, page_number] = irandom(4);
		}
	//default all textbox to this
	txtb_spr[page_number] = spr_menu;
	//choosing the speaker sprite
	speaker_sprite[page_number] = noone;
	//which side speaker sprite is
	speaker_side[page_number] = 0;
	//play sound while character is speaking
	//snd[page_number] = snd_default_voice;
	
}

//----text VFX -----//
/// @param 1st_char
/// @param last_char
/// @param col1
/// @param col2
/// @param col3
/// @param col4
function scr_text_color(_start, _end, _col1, _col2, _col3, _col4){

// loops between all characters and finds all characters between parameter & sets all color to argument
for (var c = _start; c <= _end; c++)
	{
	col_1[c, page_number-1] = _col1;
	col_2[c, page_number-1] = _col2;
	col_3[c, page_number-1] = _col3;
	col_4[c, page_number-1] = _col4;
	}
}
/// @param start
/// @param end
/// @param [strength]
function scr_text_float(_start, _end) 
{
	for (var c = _start; c <= _end; c++)
		{
		float_text[c, page_number-1] = true;
			if argument_count > 2 {
				float_strength[c, page_number-1] = argument[2];
			}
		}

}

function scr_text_shake(_start, _end){
	for (var c = _start; c <= _end; c++)
		{
		shake_text[c, page_number-1] = true;
		}
}

/// @param text
/// @param [character]
/// @param [side -1:left, 1:right]
function scr_text(_text){

scr_set_defaults_for_text();
	
text[page_number] = _text;

	//get char info if char is specified (can add voices too)
	if argument_count > 1 {
		switch (argument[1])
			{
			case "cat_angel":
				speaker_sprite[page_number] = spr_talk_Cat_Angel;
				txtb_spr[page_number] = spr_menu;
				//snd[page_number] = snd_file;
				break;
			
			case "god":
				speaker_sprite[page_number] = spr_talk_god;
				txtb_spr[page_number] = spr_menu;
				break;
			
			}
	}
	
	//side the character will appear on
	if argument_count > 2 {
	 speaker_side[page_number] = argument[2];
	}

page_number++;

}


///@param text_id
function create_textbox(_text_id) {

	with(instance_create_depth(0,0,-9999, obj_textbox))
		{
		scr_game_text(_text_id);
		}

}

///param option
///param link_id

function scr_option (_option, _link_id){
	
	option[option_number] = _option;
	option_link_id[option_number] = _link_id
	
	option_number++;
	
}


///param +number trust
function scr_add_trust (_trust){
	
global.TrustValue = global.TrustValue + _trust;

}

///param -number trust
function scr_subtract_trust (_trust){
	
global.TrustValue = global.TrustValue - _trust;

}

///param number
function scr_add_ment (_Ment){
	
global.MentValue = global.MentValue + _Ment;

}

///param number
function scr_subtract_ment (_Ment){
	
global.MentValue = global.MentValue - _Ment;

}


#region ///NPC script tracker bullshit///

/// param script_name
function scr_cha_scr_npc3 (_script){

global.npc3 = _script

}

#endregion