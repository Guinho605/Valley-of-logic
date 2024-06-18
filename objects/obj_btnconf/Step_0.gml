// Evento Step de obj_btnconf
if (place_meeting(x, y, obj_player)) {
    isPressed = true;
    if (global.selectedAnswer != "") {
        if (global.selectedAnswer == global.correctAnswer) {
            global.bossLife -= 1;
            // Adicione feedback visual/sonoro para acerto
        } else {
            global.playerLife -= 1;
            // Adicione feedback visual/sonoro para erro
        }
        global.selectedAnswer = "";
        global.chooseQuestion(); // Chama a função global para definir a próxima pergunta
    }
} else {
    isPressed = false;
}
