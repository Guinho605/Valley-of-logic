/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var gui_largura = display_get_gui_width();
var gui_altura = display_get_gui_height();
var xx = 0;
var yy = gui_altura - 200;

draw_set_color(c_black);
draw_rectangle(xx,yy, gui_largura, gui_altura,0);

draw_set_font(ft_cutscene)
draw_set_color(c_white);

var texto_atual = string_copy(texto[index],1,index_letra);

if(index_letra < string_width(texto[index]))
{
	index_letra = index_letra + 0.5	
}
draw_set_halign(fa_center);

draw_text((gui_largura/2),yy + 50,texto_atual);
draw_set_halign(-1);
