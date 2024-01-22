/// @param text_id
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_game_text(_text_id){

switch (_text_id){

#region //-----------Tutorial Text---------//
	case "Tutorial1": //script one of NPC Name
	scr_text("blabla something something paper", "paper_cutscene");
	scr_text("somethin somethin running away", "cutscene_1");
	scr_text("something something crying little bitch", "cutscene_2");
		scr_text("Welcome, would you like a tutorial? Press W & S to select and Space to Confirm.");
			scr_option("Yes", "player wants tutorial");
			scr_option("No", "player hates tutorial");
			break;
			
				case ("player wants tutorial"):
				scr_text("Press Space to progress through or skip dialogue")
				scr_text("W,A,S,D is used to move your character, relationally to the direction you want to move");
				scr_text("Press Space once you are close to a character or object to try and interact with them.")
				scr_text("Things you can interact with will have a flickering icon above it once approched")
				scr_text("Thats all for now, good luck!!")
					scr_text_float(19, 30, 4);
					scr_option("Ok", "Tutorial Forest");
					break;
				
				case "Tutorial Forest":
				room_goto(rm_forest);
				scr_text("After tripping into a portal you find yourself in this Straaaange place")
					scr_text_float(55,65, 4)
					scr_text_color(55, 65, c_orange,c_orange,c_orange,c_orange)
				scr_text("You see a small house up north...")
				scr_text("And a huge forest down South")
				
				break;
			
				case ("player hates tutorial"):
					scr_text("ok.");
					room_goto(rm_forest);
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

#region //---------Cauldron------//
case "Cauldron":
	scr_text("The cauldron is hot, but no sign of magic. maybe you should put something in it", "Cauldron")
		for(i = 0; i < ds_list_size(global.AllRecipes); i++)
		{
			scr_option(global.AllRecipes[| i].PotionName, $"PotionLink{i + 1}");
			
		}
		scr_option("Ancestral Potions","Ancestral Potions");
	break;
	case "PotionLink1":
		{
				var costString = "Cost:";
				var index = 0;
				for (i = 0; i < ds_list_size(global.AllRecipes[| index].ItemAmountList); i++)
				{
					
						show_debug_message(string(global.AllRecipes[| 0].ItemAmountList[| i].RequireAmount) + "Yippeee");
						costString += string(global.AllRecipes[| index].ItemAmountList[| i].RequireName);
						costString +=  " (";
						costString += string(global.AllRecipes[| index].ItemAmountList[| i].RequireAmount);
						costString += "),";
						global.whatCurrentPotion = global.AllRecipes[| index].PotionName; 
						
				}
				scr_text(costString, "Cauldron");
				
				scr_option("Brew", "_brewingPotion")
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
						costString += " (";
						costString += string(global.AllRecipes[| index].ItemAmountList[| i].RequireAmount);
						costString += "),";
						global.whatCurrentPotion = global.AllRecipes[| index].PotionName; 
				}
				scr_text(costString, "Cauldron");
				
				scr_option("Brew", "_brewingPotion");
		}
	break;

	case "_brewingPotion":
		{
				ExchangeRecoursesForItem(
				$"{global.whatCurrentPotion}", 
				CreateItemNamesForRecipe(["Spider_Eye", "Rat_Tail"]),
				CreateItemAmountForRecipe([3, 1])
				);
		}
	break;
	
	case "Ancestral Potions":
	scr_text("Choose the Ancestral Potion to Brew")
		scr_option("Rattoui: 15 Rat tails", "Potion1")
		scr_option("Spidader: 15 Spider eyes", "Potion2")
		scr_option("Snnaka: 15 Snake Skin", "Potion3")
		scr_option("Rosari: 15 Red Petals", "Potion4")
	break;
	
	case "Potion1":
	if global.rattail >= 15{
		scr_text("You brewed Rattoui, one step closer to completeing the ritual.")
		global.bluepotion = 1}else{
		scr_text("You don't have enough Rat Tails.")
		}
	break;
	case "Potion2":
	if global.spidereye >= 15{
		scr_text("You brewed Spidader, one step closer to completeing the ritual.")
		global.greenpotion = 1}else{
		scr_text("You don't have enough Rat Spider Eyes.")
		}
	break;
	case "Potion3":
	if global.snakeskin >= 15{
		scr_text("You brewed Snnaka, one step closer to completeing the ritual.")
		global.orangepotion = 1}else{
		scr_text("You don't have enough Snake Skin.")
		}
	break;
	case "Potion4":
	if global.flowerpetal >= 15{
		scr_text("You brewed Rosari, one step closer to completeing the ritual.")
		global.redpotion = 1}else{
		scr_text("You don't have enough Flower Petals.")
		}
	break;
	case "Potion5":
	if global.spikes >= 15{
		scr_text("You brewed Rosari, one step closer to completeing the ritual.")
		global.purplepotion = 1}else{
		scr_text("You don't have enough Rat Tails.")
		}
	break;
#endregion

#region//-------Masked Tutor--------//
case "Tutor":
		scr_text("Halt stranger! Reveal thy name and purpose at once!", "Tutor");
		scr_text("...Where is this place?", "Tutor");
		scr_text("Preposterous, I am the one asking. How did you find these woods?", "Tutor");
		scr_text("Fell through a hole in Salem?", "Tutor");
		scr_text("...an infiltrator wouldn't make such a lackluster lie.", "Tutor");
		scr_text("and I think I know what this be. Come along child, into the house!!", "Tutor");
			scr_pass_time(30);
	break;
#endregion

#region//-------Enter House 1--------//
case "Enter House 1":
		scr_text("Mother Supreme!! An Abigail decendant just arrived!!", "Tutor");
		scr_text("Where?", "Supreme", -1);
		scr_text("Tis them, Mother Supreme! Right here!", "Tutor", 1);
		scr_text("Indeed tis! How wonderful! Thy power shines as did thy ancestor. Oh how we missed Abigails presence.", "Supreme");
		scr_text("Fear not child, we mean no harm. My name is Annabeth and I am the Supreme witch of the Coven of Nycatlis.", "Supreme");
		scr_text("Your great grandmother seven genrations back was one of us, child. However, since her tragic execution we have longed for a descender of hers to come back.", "Supreme");
		scr_text("Great Nyctalis must have sent you to save us!", "Supreme");
		scr_text("We need 5 ancestral potions and do a reverse ritual. But for that, we needed a full coven, which we now finally have with you here!", "Supreme");
		scr_text("Head on to the library and chat with our sister Gertrude. She shall start you on your magical journey! We shall meet again soon. Good luck!", "Supreme",-1);
		scr_text("You can talk to people by pressing <Space> once near.")
			scr_pass_time(30);
break;

#endregion

#region//-------Statue--------//
case "Statue":
		scr_text("It is written: A tribute to our spirit animal SNUSNU", "Statue");
		scr_text("You are going to be offering 5 diffrent special potions to this statue in order to open a portal back to your home", "Tutor");
			scr_text_color(40, 55, c_purple, c_purple, c_purple, c_purple)
			scr_text_float(40, 55)
		scr_text("You feel a stare of anticipation from the statue", "Statue");
			scr_cha_scr_Statue("Statue 2")
case "Statue 2":
		scr_text("It is written: A tribute to our spirit animal SNUSNU", "Statue");
		break;

#endregion

#region//-------Medic--------//
case "Medic_player_died_once":
		scr_text("Seems like you were on your way to your death my dear.", "Medic", 1);
		scr_text("My divination magic predicted your death in " + string(global.TempMinuts)+ " minuts", "Medic", 1);
			scr_text_color(55, 65, c_red, c_red, c_red, c_red)
			scr_text_float(55, 65)
		scr_text("So I summoned you to warn you about it.", "Medic", 1);
		scr_text("Whatever you were going to do, maybe don't?", "Medic", 1);
		scr_text("Or you can keep running into the woods like a wild man", "Medic", 1);
			scr_cha_scr_trigger_speech_medic("Medic_player_died_twice+")
			global.playerdiedonce = 0;
		break;
		
case "Medic_player_died_twice+":
		scr_text("You were going to die in " + string(global.TempMinuts) + " minuts", "Medic", 1);
		global.playerdiedonce = 0;
		break;
#endregion

#region//-------Gertrude--------//
case "Meet Gertrude":
		scr_text("Welcome baby witch, I am Gertrude, a Magus. We shall begin your training at once!", "Gertrude");
		scr_text("The first spells you will learn is Mystic strike", "Gertrude");
		scr_text_color(36, 49, c_purple, c_purple, c_purple, c_purple);
		scr_text("Go in the woods on the south outside, you can practice on monsters there.", "Gertrude");
		scr_text("You can now cast Mystic strike");
			scr_text_color(17, 30, c_purple, c_purple, c_purple, c_purple);
			scr_pass_time(30);
			global.startWall = 0;
		scr_text("Hold Left Mouse button to shoot your spell once in the forest.");
		scr_text("Aim by moving your mouse cursor.");
		break;
#endregion

#region//-------Anyanka--------//
case "Before Gertrude":
		scr_text("I'm not Gertrude, she's on the left.", "Anyanka");
		scr_text("Come back to me after you do whatever Gertrude told you.", "Anyanka");
		break;
#endregion

#region//-------Out of Time--------//
case "Out of Time":
		scr_text("Its past 22:00, You need to defeat the monsters before they get stronger tommorow");
			scr_text_color(64, 72, c_red, c_orange, c_red, c_orange);
		break;
#endregion

#region//-------Cat 1--------//
case "WiseCat1":
		scr_text("Meow~");
		scr_text_float(0,5, 5)
		scr_text("First arouse in the person an eager want. He who can do this has the whole world with him.");
		scr_text("He who cannot walks a lonely way.");
		scr_text("I've seen countless parents expect their child to share the same viewpoint of a thirty year old.");
		scr_text("The question is always, How do I align what I want with what they want?");
		scr_text("Don't criticize, condemn or complain");
		scr_text("Give honest and sincere appreciation");
		scr_text("Arouse in the other person an eager want");
		scr_text("Follow these principles and you can get the world to revolve around you");
			scr_cha_scr_trigger_cat_1("Meow");
			
case "WiseCat2":
		scr_text("Meow~");
		scr_text_float(0,5, 5)
		scr_text("Don't forget to smile kid.");
		scr_text("It enriches those whoe receive, without impoverishingthose who give.");
		scr_text("It happens in a flash and the memory sometimes lasts forever.");
		scr_text("None are so rich they can get along without it.");
		scr_text("None so poor but are richer for its benefits.");
		scr_text("It creates hapiness, daylight to the discouraged, sunshine to the sad, and is the antidote for trouble.");
		scr_text("Yet it cannot be bought, begged, borrowed, or stolen, for it is no good to anybody till given.");
		scr_text("Nobody needs a smile so much as those who have none left to give!");
		scr_cha_scr_trigger_cat_1("Meow");
break;

case "WiseCat3":
		scr_text("Meow~");
		scr_text_float(0,5, 5)
		scr_text("Want to make people agree with you?");
		scr_text("If you are going to prove anything, don't let anybody know it.");
		scr_text("Men must be taught as if you taught them not.");
		scr_text("and things unknown proposed as things forgot.");
		scr_text("You cannot teach a man anything; you can only help him to find it within himself.");
		scr_text("Be wiser than others, but do not tell them so.");
		scr_text("Only thing you should know is that you know nothing.");
		scr_text("Quit telling people they are wrong and you will find it that it pays.");
		scr_cha_scr_trigger_cat_1("Meow");
break;

case"Meow":
	scr_text("Meow~")
	scr_text_float(0,5, 5)
#endregion



	}	
}