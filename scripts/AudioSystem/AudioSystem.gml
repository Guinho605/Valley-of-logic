#macro au_type_sfx "SFX"
#macro au_type_music "MUSIC"

function AudioController(_str_sfx, _str_music, _str_master) constructor {
	global.__audio_controller__ = self;
	list_audio = ds_list_create();
	
	global_sfx = _str_sfx;
	global_music = _str_music;
	global_master = _str_master; 
	
	///@method Update()
	static Update = function(){
		vol_sfx = variable_global_get(global_sfx) * variable_global_get(global_master);
		vol_music = variable_global_get(global_music) * variable_global_get(global_master);
		
		var _size = ds_list_size(list_audio);
		for (var i = 0; i < _size; i++){
			list_audio[| i].Update();
		}
	}
}

function AudioElement() constructor{
	controller = global.__audio_controller__;
	//se adicionando a si mesmo na lista de audio
	ds_list_add(controller.list_audio, self);
	
	play = true;
	sound_id = noone;
	type = noone;
	offset = 1;
	
	///@method Update
	static Update = function() { }
}

function AudioPlaySingle(_sound_id, _au_type, _offset = 1) : AudioElement() constructor{
	sound_id = _sound_id;
	type = _au_type;
	offset = _offset;
	
	///@method Update
	static Update = function() { 
		//coloquei ora tocar 
		if (play){
			//tocando de fato
			var _snd = audio_play_sound(sound_id, 0, false);
			
			//descobrindo o volume 
			var _level
			if (type == au_type_sfx){
				_level = controller.vol_sfx * offset;
			}
			else {
				_level = controller.vol_music * offset;
			}
			
			//definindo de fato o volume
			audio_sound_gain(_snd, _level, 0);
			play = false;
		}
	}
}

/*
function AudioPlayLoop(_sound_id, _au_type, _offset = 1) : AudioElement() constructor {
	sound_id = _sound_id;
	type = _au_type;
	offset = _offset;
	id_playind = noone; 
	vol = 0;
	vlo_spd = 1 / (game_get_speed(gamespeed_fps) * (_milli /  0.001)); 
	
	///@method Update
	static Update = function() { 
		//colocando pra tocar
		if (play) {
			//tocando de fato
			if (!audio_is_playing(id_playind)){
				id_playind = audio_play_sound(sound_id, 1, true);
			}
			
			//aumentando o volume 
			if (vol < 1) {vol += vol_spd} else {vol = 1};
		}
		
		//parando de tocar 
		if (!play){
			//abaixo o volume 
			if (vol > 0) {vol -= vol_spd}
			//parando de tocar
			else {
				vol = 0; 
				//parando de fato
				audio_stop_sound(id_playind);
			}
		}
		
		//definindo o volume 
		if (audio_is_playing(id_playind)){
			//descobrndo o volume
			var _level
			if (type == au_type_sfx){
				_level = controller.vol_sfx * vol * offset;
			}
			else {
				_level = controller.vol_music * vol * offset;
			}
			
			//defininfo de fato
			audio_sound_gain(id_playind, _level, 0); 
		}
	}
}