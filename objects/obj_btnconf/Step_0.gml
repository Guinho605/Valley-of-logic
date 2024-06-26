if (place_meeting(x, y, obj_player) && global.selectedAnswer != "") {
    if (global.selectedAnswer == global.correctAnswers[global.currentQuestionIndex]) {
        // Lógica para resposta correta
        global.boss_vida -= 1; // Diminui a vida do chefão

        // Mudar a sprite do chefe para a de hit (exemplo)
        with (obj_boss_vetor) {
            sprite_index = spr_boss_vetor_hit;
            hit_timer = room_speed * 0.5; // 0.5 segundos para mostrar a sprite de hit
        }
        
        // Avance para a próxima pergunta
        global.currentQuestionIndex += 1;
        if (global.currentQuestionIndex < array_length(global.questions)) {
            global.currentQuestion = global.questions[global.currentQuestionIndex];
        } else {
            global.currentQuestion = "Parabéns! Você respondeu todas as perguntas.";
            // Aqui você pode finalizar o jogo, mostrar uma tela de vitória, etc.
        }

        // Incrementar respostas corretas no obj_boss_vetor
        with (obj_boss_vetor) {
            respostas_corretas += 1;
        }
    } else {
        // Lógica para resposta incorreta
        if (!obj_btnconf.answeredIncorrectly) {
            global.vida -= 1 - 1; // Diminui a vida do jogador
            obj_btnconf.answeredIncorrectly = true; // Marca que já respondeu incorretamente

            // Atualiza a sprite do jogador para a sprite de dano (exemplo)
            with (obj_player) {
                sprite_index = spr_player_hit;
                dano = true; // Ativa o estado de dano
                timer_dano = tempo_dano; // Configura o timer de dano
                posso_perder_vida = true; // Permite que o jogador perca vida
            }
        }
    }

    // Reinicialize a resposta selecionada
    global.selectedAnswer = ""; // Limpa a resposta selecionada para evitar que seja confirmada novamente sem uma nova seleção
}

// Limpa obj_btnconf.answeredIncorrectly após processar a resposta
if (global.selectedAnswer == "") {
    obj_btnconf.answeredIncorrectly = false;
}
