/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _velh = x - xprevious;
var _velv = y - yprevious;

with(obj_player){
	//movimento horizontal
	if(place_meeting(x, y, other)){
		if(place_meeting(x,y + abs(other.spd + 1), other){
			move_and_collide(_velh, 0, obj_chao, abs(other.spd), _velh, _velv);
		}
	}
	
	//movimento vertical
	if(!place_meeting(x, y + _velv, obj_chao))
	{
		if(place_meeting(x, y + abs(other.spd) + 1, other))
		{
			y += _velv;	
		}
	}
	if(place_meeting(x, y,other)
}











