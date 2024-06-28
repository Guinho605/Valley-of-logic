/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//colisão horizontal
//checando colissão
var _col = instance_place(x + velh, y, obj_chao);
//if colisão
if( _col)
{
	//direita
	if (velh > 0)
	{
		//grudando na parte esquerda da parede
		x = _col.bbox_left + (x - bbox_right); 
	}
	//esquerda
	if (velh < 0)
	{
		x = _col.bbox_right + (x - bbox_left);
	}
	//colisão
	velh = 0;
	}

x += velh;

var _col = instance_place(x, y + velv, obj_chao);
if (_col)
{
	if (velv > 0)
	{
		//baixo
		y = _col.bbox_top + (y - bbox_bottom);
	}
	if (velv < 0)
	{
		//cima
		y = _col.bbox_bottom + (y - bbox_top);
	}
	//colisão
	velv = 0;
	
}
y += velv;







