// Evento de Colisão com o Jogador
if (place_meeting(x, y, obj_player)) {
    isPressed = true;
    show_debug_message("Botão Confirm pressionado");
    if (global.selectedAnswer == global.correctAnswer) {
        global.bossLife -= 1;
        show_debug_message("Resposta correta");
        // Adicione feedback visual/sonoro para acerto
    } else {
        global.playerLife -= 1;
        show_debug_message("Resposta incorreta");
        // Adicione feedback visual/sonoro para erro
    }
    global.selectedAnswer = "";
    // Chama a função para definir a próxima pergunta
    chooseQuestion();
}
