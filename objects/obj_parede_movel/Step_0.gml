/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
hspd = move_dir * move_spd;

if(place_meeting(x+sign(hspd),y,obj_chao))
{
	move_dir*=-1;}
var c = place_meeting(x+sign(hspd),y,obj_player) or place_meeting(x,y-1,obj_player);
if(c)
{
	with(obj_player){
		if(!place_meeting(x+other.hspd,y,obj_chao)){
			x+=other.hspd;
		}
	}
}
x+=hspd;










