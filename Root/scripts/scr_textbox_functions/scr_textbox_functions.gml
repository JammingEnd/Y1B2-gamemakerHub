//store where in body text it should move onto next line
function scr_set_defaults_for_text(){
	line_break_pos[0, page_number] = 999;
	//tracks number of line breaks
	line_break_num[page_number] = 0;
	//keep track width of pixels to reset each character's x position 
	//(measure length of first broken line of text to measure next line break)
	line_break_offset[page_number] = 0;
	//default all textbox to this
	txtb_spr[page_number] = spr_menu;
	//choosing the speaker sprite
	speaker_sprite[page_number] = noone;
	//which side speaker sprite is
	speaker_side[page_number] = 0;
}




/// @param text
/// @param [character]
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
				break;
			
			case "god":
				speaker_sprite[page_number] = spr_talk_god;
				txtb_spr[page_number] = spr_menu;
				break;
			
			}
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
