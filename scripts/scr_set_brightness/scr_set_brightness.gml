/// scr_set_brightness(novo_brilho)
/// Define o brilho global do jogo e ajusta as propriedades visuais
function scr_set_brightness(novo_brilho) {
    // Define o brilho global do jogo limitando-o entre 0.1 e 1.0
    global.brilho = clamp(novo_brilho, 0.1, 1.0);
    
    // Atualiza propriedades visuais em todas as salas
    with (obj_brightness_control) {
        // Chama o evento para atualizar as propriedades visuais do controle de brilho
        event_perform(ev_draw, ev_gui);
    }
}
