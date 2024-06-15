// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_colissions(){
	var _col_h = move_and_collide(velh, 0, obj_chao, abs(velh) + 1);
	if(array_length(_col_h) > 0)
	{
		velh = 0;
	}
	
	var _col_v = move_and_collide(0, velv, obj_chao, abs(velv) + 1);
	if(array_length(_col_v) > 0)
	{
		velv = 0;	
	}
	
	is_ground = place_meeting(x,y + 1, obj_chao);
}