/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
/// Evento Drag do obj_slider_brilho
if (is_dragging) {
    if (mouse_x > x && mouse_x < x + largura_slider) {
        posicao_slider = mouse_x - x;

        // Inverte a lógica para aumentar o brilho à medida que o slider é movido para a direita
        global.brilho = 1 - (posicao_slider / largura_slider);

        // Limita o brilho entre 0.2 e 0.8 (ou 1.0, conforme necessário)
        global.brilho = clamp(global.brilho, 0.2, 0.8);
    }
}
