/// @description Setup and variables

// Game variables
global.playerControl = true;
global.playerdiedonce = 0;
global.selectColor = c_purple;
global.entered_house = 1;
global.startWall = 1;
global.redwand = 0;
global.yellowwand = 0;
global.DuckCount = 0;
global.outofcombat = 1;
//townBGMvolume = audio_sound_get_gain(snd_townBGM);
//townAmbienceVolume = audio_sound_get_gain(snd_townAmbience);
global.gameOver = false;
global.gameStart = false;

// Player states
enum playerState
{
	idle,
	walking,
	pickingUp,
	carrying,
	carryIdle,
	puttingDown,
}
// Sequence states
enum seqState
{
	notPlaying,
	waiting,
	playing,
	finished,
}
// Sequence variables
sequenceState = seqState.notPlaying;
curSeqLayer = noone;
curSeq = noone;

// NPC states
enum npcState
{
	normal,
	done,
}