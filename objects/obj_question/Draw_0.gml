/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_set_color(c_black); // Define a cor do texto
draw_set_font(ft_default); // Define a fonte (assegure-se de que você tenha uma fonte chamada fnt_default)
scr_draw_text_ext_break(770, 80, global.currentQuestion, 200); // Desenha a pergunta com quebra de linha
