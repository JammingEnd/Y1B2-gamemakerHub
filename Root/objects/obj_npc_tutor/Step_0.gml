/// @description Insert description here
// You can write your code in this editor
global.Tutor = npcname
text_id = global.Tutor

if (signal = 1){image_alpha -= 0.005};

if (image_alpha <= 0){instance_destroy()};






// Inherit the parent event
event_inherited();

