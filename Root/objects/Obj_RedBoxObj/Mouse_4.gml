//Activate / deactivate box
if (CurrentIndex == 0) {
	instance_activate_object(Obj_TextDisplay);
	CurrentIndex = 1;
} else if (CurrentIndex == 1) {
	instance_deactivate_object(Obj_TextDisplay);
	CurrentIndex = 0;
}


//draw text



