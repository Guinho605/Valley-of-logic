/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_self();
draw_rectangle(x, y, x + largura_slider, y + 10, false); // Desenha a barra do slider
draw_rectangle(x + posicao_slider - 5, y - 5, x + posicao_slider + 5, y + 15, true); // Desenha o "handle" do slider
