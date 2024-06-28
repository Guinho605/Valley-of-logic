
audio_master_gain(global.volume_som);
audio_sound_gain(sd_loop7, global.volume_musica, 0);

/*
if (keyboard_check(vk_enter) && !instance_exists(obj_player)) {
	instance_create_layer(128, 256, layer, obj_player);
	global.gamestart = true;
	 = true;
	inicia_som = true;
}

if (global.gamestart && inicia_som) {
	audio_stop_all();
	audio_play_sound(sd_chiptune,3,true);
}

if (global.gameover) {
	audio_stop_all();
	audio_play_sound(sd_loop7,3,true);
}