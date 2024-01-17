/// @param text_id
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_game_text(_text_id){

switch (_text_id){

#region //-----------Tutorial Text---------//
	case "Tutorial1": //script one of NPC Name
		scr_text("Welcome, would you like a tutorial? Press W & S to select and Space to Confirm.");
			scr_option("Yes", "player wants tutorial");
			scr_option("No", "player hates tutorial");
			break;
			
				case ("player wants tutorial"):
				scr_text("Press Space to progress through or skip dialogue")
				scr_text("W,A,S,D is used to move your character");
				scr_text("Press Space once you are close to a character or object to try and interact with them.")
				scr_text("Things you can interact with will have a flickering icon above it once approched")
				scr_text("Thats all for now, good luck!!")
					scr_text_float(19, 30, 4);
					room_goto(rm_forest);
				break;
			
				case ("player hates tutorial"):
					scr_text("ok.");
					room_goto(rm_forest);
				break;
	
#region //-----------NPC Name Template---------//
	case "npcName1": //script one of NPC Name
		scr_text("Dialogue 1", "npcName");
		scr_text("Dialogue 2", "npcName");
			scr_text_color(9, 10, c_red, c_yellow, c_red, c_yellow);
			scr_text_float(9, 10, 4);
		scr_text("Dialogue 1 of npcName2", "god", 1);
		scr_text("Dialogue 3", "npcName");
		scr_text("Dialogue 2 of npcName2", "god", -1);
		scr_text("Dialogue 4", "god");
			scr_option("Yes", "player said yes");
			scr_option("No", "player said no");
		break;
			case ("player said yes"):
			game_end();
			break;
			
			case ("player said no"):
			scr_text("Dialogue 1 player said no", "npcName");
				//change script upon choosing this option
				scr_cha_scr_npc3("name of second script if player chose no")
			break;
	
	//script 2 of NPC Name
	case ("name of second script if player chose no"):
	scr_text("Really NO?", "npcName");
		scr_option("Yes", "player said yes 2");
		scr_option("No", "Player said no 2");
	break;
		case ("player said yes 2"):
		game_end();
		break;
		
		case ("player said no 2"):
		scr_text("Dialogue 1 of player said no 2", "npcNew");
		break;	
#endregion			

#region//NPC1 - Intro guy

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
			scr_add_trust(5)
			break;
#endregion

#region //-----------Cat Angel---------//		
	case "npc2":
		scr_text("I HAVE BEEN SUMMONED AT LAST!!", "cat_angel");
		scr_text("huh? You came here to free me?", "cat_angel");
			scr_option("Yeah...", "npc2 - Yeah");
			scr_option("Nuh-uh", "npc2 - Nuh");
		break;
	case "npc2 - Yeah":
		scr_text("HAHAHAHAHA", "cat_angel");
		scr_text("Sorry bud, looks like your late to the party.", "cat_angel");
		scr_text("But hey, on the bright side you can watch me destroy the world.", "cat_angel");
		scr_text("Wanna see it now?", "cat_angel");
			scr_option("Hell Yeah", "npc2 - Hell Yeah");
			scr_option("Maybe not", "npc2 - Not");
		break;
				case "npc2 - Hell Yeah":
				scr_text("Gotcha, *Snaps Finger*", "cat_angel");
				scr_text("");
				room_goto(rm_test_dialog);
				break;
				
				case "npc2 - Not":
				scr_text("Gotcha, maybe next time", "cat_angel");
				break;
				
	case "npc2 - Nuh":
		scr_text("Huh, the folks around here must have been getting bored bringing someone the likes of you here.", "cat_angel");
		scr_text("Anyway, want to see me end the world?", "cat_angel");
			scr_option("Hell Yeah", "npc2 - Hell Yeah");
			scr_option("Maybe not", "npc2 - Not");
		break;
#endregion

#region //-----------Polish God---------//
	case "npc3":
		scr_text("Hi, I'm Przemek.", "god");
		scr_text("A Polish God by the way.", "god");
			scr_text_color(2, 12, c_red, c_yellow, c_red, c_yellow);
			scr_text_float(2, 12, 4);
		scr_text("He's lying, he's another slave worker just like you...", "cat_angel", 1);
		scr_text("I can prove it.", "god");
		scr_text("Bullshit.", "cat_angel", 1);
		scr_text("Ready?", "god");
			scr_option("My body's ready", "npc3 - ready");
			scr_option("I have a bad feeling about this, maybe later", "npc3 - Later");
		break;
			case ("npc3 - ready"):
			game_end();
			break;
			
			case ("npc3 - Later"):
			scr_text("Fine, tell me when you are ready for the truth.", "god");
				scr_cha_scr_npc3("npc3 - Later2")
			break;
	
	case ("npc3 - Later2"):
	scr_text("Are you finally ready?", "god");
		scr_option("Yes", "Player - ready");
		scr_option("Nevermind", "Player - not_ready");
	break;
		case ("Player - ready"):
		game_end();
		break;
		
		case ("Player - not_ready"):
		scr_text("You are testing my patience kid.", "god");
		break;
		
	case("god_dies"):
		scr_text("Damn Youuuuuuu", "god");
		scr_text_color(0, 14, c_red, c_yellow, c_red, c_yellow);
		scr_text_shake(0, 14);
		break;
		
#endregion			

#region //-----------Cloaked Guy Near Cat Angel---------//
	case "npc4":
		scr_text("It was tradition to always sacrifice one of our workers for demon summoning.");
		scr_text("But we decided to not do that this time, and what do you know!");
		scr_text("The Demon was summoned either way!! We assumed it was neccesary to the ritual but we didn't need to ever do that in the past.");
		scr_text("Thanks for listening man, I don't think the others realise how big of a deal this is.");
		break;
	
	case "npc5":
		scr_text("There's not much here");
		scr_text("Everyone here says the same thing, pretty boring to be honest.");
		break;
		
	case "npc6":
		scr_text("Wonder what the number on your far left corner does?");
		scr_text("I heard it keeps track of our Trust, the Time, and your Mental State.");
		scr_text("I don't know what Time is, thats a muggle concept from your culture that we don't have here");
		break;

#endregion

#region//-------Weapon Smith--------//

	case "Weapon Smith":
		scr_text("What do ya need son? I've got upgrades for ya.", "Weapon_Smith")
			scr_option("+Damage -10Ducks", "Damage_Upgrade");
			scr_option("+Firerate -15Ducks ", "Firerate_Upgrade");
			scr_option("+HP -5Ducks, HP_Upgrade", "HP_Upgrade");
		break;
		case "Damage_Upgrade":
			scr_text("Here ya go.", "Weapon_Smith");
			global.DamageValue = global.DamageValue + 1
			global.DuckCount = global.DuckCount - 10
			break;
		case "Firerate_Upgrade":
			scr_text("Here ya go.", "Weapon_Smith")
			global.FireRateValue = global.FireRateValue + 1
			global.DuckCount = global.DuckCount - 15
			break;
		case "HP_Upgrade":
			scr_text("Here ya go.", "Weapon_Smith")
			global.HpValue += 10
			global.DuckCount = global.DuckCount - 5
			break;
#endregion

case "Cauldron":
	scr_text("The cauldron is hot, but no sign of magic. maybe you should put something in it", "Cauldron")
		for(i = 0; i < ds_list_size(global.AllRecipes); i++)
		{
			scr_option(global.AllRecipes[| i].PotionName, $"PotionLink{i + 1}");	
			
		}
	break;
	case "PotionLink1":
		{
				var costString = "Cost:";
				var index = 1;
				for (i = 0; i < ds_list_size(global.AllRecipes[| index].ItemAmountList); i++)
				{
					
						show_debug_message(string(global.AllRecipes[| 0].ItemAmountList[| i].RequireAmount) + "Yippeee");
						costString += string(global.AllRecipes[| index].ItemAmountList[| i].RequireName);
						costString +=  ">";
						costString += string(global.AllRecipes[| index].ItemAmountList[| i].RequireAmount);
						costString += "<,";
						
				}
				scr_text(costString, "Cauldron");
				
		}
	break;
	case "PotionLink2":
		{
				var costString = "Cost:";
				var index = 1;
				for (i = 0; i < ds_list_size(global.AllRecipes[| index].ItemAmountList); i++)
				{
					
						//show_debug_message(string(global.AllRecipes[| 0].ItemAmountList[| i].RequireAmount) + "Yippeee");
						costString += string(global.AllRecipes[| index].ItemAmountList[| i].RequireName);
						costString +=  ">";
						costString += string(global.AllRecipes[| index].ItemAmountList[| i].RequireAmount);
						costString += "<,";
						
				}
				scr_text(costString, "Cauldron");
				
		}
	break;
	
#region//-------Masked Tutor--------//
case "Tutor":
		scr_text("I HAVE BEEN SUMMONED AT LAST!!", "Tutor");
		scr_text("huh? You came here to free me?", "Tutor");
		break;

#endregion

//Do not write below this point
	}	
}