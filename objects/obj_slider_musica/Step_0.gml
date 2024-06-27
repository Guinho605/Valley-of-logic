/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (is_dragging) {
    if (mouse_x > x && mouse_x < x + largura_slider) {
        posicao_slider = mouse_x - x;
        global.volume_musica = 1 - posicao_slider / largura_slider;
		  
    }
}
