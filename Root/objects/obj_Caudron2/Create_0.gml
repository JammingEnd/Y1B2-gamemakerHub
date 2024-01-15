/// @description Insert description here
// You can write your code in this editor
event_inherited();

global.AllRecipes = ds_list_create()


ds_list_add(global.AllRecipes, CreateNewRecipe(
"Healing_potion", 
CreateItemNamesForRecipe(["Spider_Eye", "Rat_Tail"]),
CreateItemAmountForRecipe([3, 1])
));
