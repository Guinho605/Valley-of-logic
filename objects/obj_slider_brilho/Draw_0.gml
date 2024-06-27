/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_self();
draw_rectangle(x, y, x + largura_slider, y + 10, false); // Desenha a barra do slider
draw_rectangle(x + posicao_slider - 5, y - 5, x + posicao_slider + 5, y + 15, true); // Desenha o "handle" do slider

// Ajuste o brilho do jogo
draw_set_alpha(global.brilho);

// Desenha uma tela inteira transparente preta para ajustar o brilho
draw_rectangle(0, 0, display_get_width(), display_get_height(), false);

// Resetando o alpha
draw_set_alpha(1);
