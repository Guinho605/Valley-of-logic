// Evento de Colisão com o Jogador
if (place_meeting(x, y, obj_player)) {
    global.selectedAnswer = "A";
    isPressed = true;
    show_debug_message("Botão A pressionado");
    // Adicione qualquer feedback visual ou sonoro aqui
}
