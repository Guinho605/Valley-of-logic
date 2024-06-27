/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
/// Evento Drag do obj_slider_brilho
if (is_dragging) {
    var slider_mouse_x = mouse_x - x; // Posição relativa do mouse dentro do slider
    
    // Limita a posição do slider dentro dos limites
    posicao_slider = clamp(slider_mouse_x, 0, largura_slider);
    
    // Calcula o novo brilho com base na posição do slider
    global.brilho = 1 - (posicao_slider / largura_slider);
    
    // Limita o brilho entre 0.1 e 1.0
    global.brilho = clamp(global.brilho, 0.0, 0.8);
}
