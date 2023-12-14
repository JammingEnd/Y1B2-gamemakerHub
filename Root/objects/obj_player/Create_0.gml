//global values
global.TrustValue = 0;
global.TimeValue = 0;
global.MentValue = 100;


walkSpeed = 16;
vx = 0;
vy = 0;
dir = 3;
moveRight = 0;
moveLeft= 0;
moveUp = 0;
moveDown = 0;
nearbyNPC = noone;
lookRange = 200;
hasGreeted = false;
npcPrompt = noone;
myState = playerState.idle;
runSpeed = 0;
runMax = 12;
running = false;
startDust = 0;

// Create listener and set orientation
audio_listener_set_position(0,x,y,0);
audio_listener_set_orientation(0,0,1,0,0,0,1);

// Player Sprite array [myState][dir]
// Idle (Temp Sprites)
playerSpr[playerState.idle][0] = spr_player_idle_right;
playerSpr[playerState.idle][1] = spr_player_idle_up;
playerSpr[playerState.idle][2] = spr_player_idle_left;
playerSpr[playerState.idle][3] = spr_player_idle_down;

// Walking (Temp Sprites)
playerSpr[playerState.walking][0] = spr_player_walk_right;
playerSpr[playerState.walking][1] = spr_player_walk_up;
playerSpr[playerState.walking][2] = spr_player_walk_left;
playerSpr[playerState.walking][3] = spr_player_walk_down;