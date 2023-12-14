/// @param text_id
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_game_text(_text_id){

switch (_text_id){
	
	case "npc1":
		scr_text("Hi! Welcome to Witch Cauldron.Co.")
		scr_text("You have been hired to partake in the construction of the demon summoning circle")
			scr_option("H-Hired??.", "npc1 - Hired");
			scr_option("I want my lawyer.", "npc1 - Hired");
			scr_option("Hell yeah!! Lets get that Demon booty summoned!", "npc1 - Hell yeah");
		break;
		case "npc1 - Hired":
			scr_text("Don't think you can get out of here, we got your cat as liability.");
			scr_text("And incase you forgor, you're in the witch realm where you have no rights as a muggle.")
			scr_text("You'll see my co-workers in each room, talk to each one of them for instructions.")
			break;
		case "npc1 - Hell yeah":
			scr_text("Um... Glad you'r stoked about this.")
			scr_text("You'll see my co-workers in each room, talk to each one of them for instructions.")
			break;
		
//------------NPC2--------------//
		
	case "npc2":
		scr_text("I HAVE BEEN SUMMONED AT LAST!!")
		scr_text("huh? You came here to free me?")
			scr_option("Yeah...", "npc2 - Yeah");
			scr_option("Nuh-uh", "npc2 - Nuh");
		break;
	case "npc2 - Yeah":
		scr_text("HAHAHAHAHA")
		scr_text("Sorry bud, looks like your late to the party.")
		scr_text("But hey, on the bright side you can watch me destroy the world.")
		scr_text("Wanna see it now?")
			scr_option("Hell Yeah", "npc2 - Hell Yeah");
			scr_option("Maybe not", "npc2 - Not");
		break;
				case "npc2 - Hell Yeah":
				scr_text("Gotcha, *Snaps Finger*");
				scr_text("");
				room_goto(rm_test_dialog);
				break;
				
				case "npc2 - Not":
				scr_text("Gotcha, maybe next time");
				break;
				
	case "npc2 - Nuh":
		scr_text("Huh, the folks around here must have been getting bored bringing someone the likes of you here.")
		scr_text("Anyway, want to see me end the world?")
			scr_option("Hell Yeah", "npc2 - Hell Yeah");
			scr_option("Maybe not", "npc2 - Not");
		break;
	
//-----------NPC3---------//
	
	case "npc3":
		scr_text("Hi, I am the Polish god");
		scr_text("The world has indeed ended.");
		scr_text("Too bad I won't be able to fuck your mom anymore.");
			scr_option("What the-", "npc3 - What");
		break;
			case ("npc3 - What"):
			game_end();
			break;

	}
}