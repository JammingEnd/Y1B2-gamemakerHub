// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CreateNewRecipe(ReturnItem, ReqItemNames, ReqItemAmount) {
	
	var newRecipe = instance_create_layer(999,999, "Instances", obj_RecipeDefinition)
	newRecipe.PotionName = ReturnItem
	for(i = 0; i < ds_list_size(ReqItemAmount); i++)
	{
		
		var newAmountNameDef = instance_create_layer(999,999, "Instances", obj_itemNameCountDef)	
		
		newAmountNameDef.RequireName = ReqItemNames[| i];
		newAmountNameDef.RequireAmount = ReqItemAmount[| i];
		ds_list_add(newRecipe.ItemAmountList, newAmountNameDef);
	}
	return newRecipe;
}

function CreateItemNamesForRecipe(names)
{
	var namesList = ds_list_create();
	for(i = 0; i < array_length(names); i++)
	{
		ds_list_add(namesList, array_get(names, i));
	}
	return namesList;
}

function CreateItemAmountForRecipe(amounts)
{
	var AmountList = ds_list_create();
	for(i = 0; i < array_length(amounts); i++)
	{
		ds_list_add(AmountList, array_get(amounts, i));
	}
	return AmountList;
}

function HasEnoughItemsForRecipe(potionName)
{
	var recipeIndex = ds_list_find_index(global.AllRecipes, potionName)
}