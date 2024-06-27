/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_set_font(ft_menu);


var dist = 60;
var gui_largura = display_get_gui_width();
var gui_altura = display_get_gui_height();
var x1 = gui_largura / 2;
var y1 = gui_altura / 1.9 - ((op_max - 1) * dist / 2);

for (var i=0; i < op_max; i++)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	if(index == i)
	{
		draw_set_color(#FE502D);
	}else{
		draw_set_color(c_black);
	}
	
	 draw_text(x1, y1 + (dist * i), opcoes[i]);
}

draw_set_font(-1);









