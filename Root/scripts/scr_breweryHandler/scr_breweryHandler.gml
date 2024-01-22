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
	var can_buy = true;
	var recipeIndex = 0;
	for(i = 0; i < ds_list_size(global.AllRecipes); i++)
		{
			if(global.AllRecipes[| i].PotionName == potionName) 
			{
				recipeIndex = i;	
			}
			
		}
	var recipe = ds_list_find_value(global.AllRecipes, recipeIndex);
	
	for(i = 0; i < ds_list_size(recipe.ItemAmountList); i++)
	{
		var playerItemIndex = 0;
		var itemToSearch = recipe.ItemAmountList[| i].RequireName;
		for(b = 0; b < ds_list_size(global.playerInventory); b++) 
		{
			var itemInPlayerInv = global.playerInventory[| b].itemName;
			if(recipe.ItemAmountList[| b].RequireName == itemInPlayerInv)
			{
				playerItemIndex = b;
			}
		}
		if(instance_exists(global.playerInventory[| playerItemIndex]))
		{
			if(global.playerInventory[| playerItemIndex].amount >= recipe.ItemAmountList[| i].RequireAmount)
			{
				can_buy = true	
			}
			else {
				can_buy = false	
			}
		}
		else {
			can_buy = false;
		}
		
	}
	return can_buy;
	
}