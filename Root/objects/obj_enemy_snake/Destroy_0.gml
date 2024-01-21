//get rid of bullet you shot
if instance_exists(bulletInst) && bulletInst.state == 0
{
	bulletInst.destroy = true;	
}

instance_create_depth(x+random_range(-100, 100), y+random_range(-100, 100), -y, obj_item_drop);
instance_create_depth(x+random_range(-100, 100), y+random_range(-100, 100), -y, obj_item_drop);
instance_create_depth(x+random_range(-100, 100), y+random_range(-100, 100), -y, obj_item_drop);
instance_create_depth(x+random_range(-25, 25), y+random_range(-25, 25), -y, obj_snake_skin);

global.current_enemy_count--
global.current_spider_count--

OnDeath(obj_enemy_pop);