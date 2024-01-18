/// @description Insert description here
// You can write your code in this editor
event_inherited();

global.AllRecipes = ds_list_create();

global.whatCurrentPotion = "";

ds_list_add(global.AllRecipes, CreateNewRecipe(
"Healing_potion", 
CreateItemNamesForRecipe(["Spider_Eye", "Rat_Tail"]),
CreateItemAmountForRecipe([3, 1])
));

//heres a new item rares :)

ds_list_add(global.AllRecipes, CreateNewRecipe(
"Speed_Potion", 
CreateItemNamesForRecipe(["Spider_Eye", "Rat_Tail"]),
CreateItemAmountForRecipe([2, 6])
));

depth = -y;