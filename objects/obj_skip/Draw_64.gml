/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

draw_set_font(ft_cutscene);

var dist = 60;
var gui_largura = display_get_gui_width();
var gui_altura = display_get_gui_height();
var x1 = gui_largura - 10; // Ajuste a posição horizontal
var y1 = 10; // Ajuste a posição vertical

for (var i = 0; i < op_max; i++) {
    draw_set_halign(fa_right); // Alinhar à direita
    draw_set_valign(fa_top); // Alinhar ao topo

    if (index == i) {
        draw_set_color(c_white);
    } else {
        draw_set_color(c_white);
    }

    draw_text(x1, y1 + (dist * i), opcoes[i]);
}

draw_set_font(-1);
