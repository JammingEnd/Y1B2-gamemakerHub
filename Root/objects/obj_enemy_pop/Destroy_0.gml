//get rid of bullet you shot
if instance_exists(bulletInst) && bulletInst.state == 0
{
	bulletInst.destroy = true;	
}

instance_create_depth(x, y, -y, obj_item_drop)