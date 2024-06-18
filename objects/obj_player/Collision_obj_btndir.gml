// Evento de Colisão com o Jogador
if (place_meeting(x, y, obj_player)) {
    global.selectedAnswer = "B";
    isPressed = true;
    show_debug_message("Botão B pressionado");
    // Adicione qualquer feedback visual ou sonoro aqui
}
