// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function Script1(){

}

randomize();
global.transicao = false;
global.max_vida = 3;
global.vida = global.max_vida;




function mudando_sprite(_sprite)
{
	image_speed = 1;
	//checar se estou com asprite certa
	if(sprite_index != _sprite)
	{
		sprite_index = _sprite;
		image_index = 0;
	}
}