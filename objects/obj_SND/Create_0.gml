/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

global.VOL_SFX = 1;
global.VOL_MUSIC = 1;
global.VOL_MASTER = 1;

audio_controller = new AudioController("VOL_SFX", "VOL_MUSIC", "VOL_MASTER");

sfx_walk = new AudioPlaySingle(sd_walk, au_type_sfx);  
sfx_jump = new AudioPlaySingle(sd_jump, au_type_sfx);  
sfx_dead = new AudioPlaySingle(sd_dead, au_type_sfx);  
sfx_dano = new AudioPlaySingle(sd_dano, au_type_sfx);
sfx_dash = new AudioPlaySingle(sd_dash, au_type_sfx); 