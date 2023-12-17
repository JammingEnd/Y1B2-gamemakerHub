//receive damage

//this only registers one bullet per frame
if place_meeting (x, y, obj_damage_enemy)
{
	var _inst = instance_place (x, y, obj_damage_enemy);
	
	//take damage from specific instance
	hp -= _inst.damage;
	
	//tell the damage instance to destroy itself
	_inst.destroy = true;
}


//death
if hp <= 0 {instance_destroy()}



