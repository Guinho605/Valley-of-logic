/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
/// Evento Draw GUI do obj_brightness_control
draw_set_alpha(1 - global.brilho); // Aplica o brilho conforme definido pelo jogador

// Desenhe uma tela transparente para ajustar o brilho
draw_rectangle_color(0, 0, display_get_width(), display_get_height(), c_black, c_black, c_black, c_black, false);

// Restaura o alpha para o padrão após o desenho
draw_set_alpha(1);

// Mensagem de debug para verificar o valor de brilho
draw_text(10, 10, "Brilho: " + string(global.brilho));
