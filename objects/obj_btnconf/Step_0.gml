if (place_meeting(x, y, obj_player) && global.selectedAnswer != "" && global.currentQuestionIndex < array_length(global.correctAnswers)) {
    show_debug_message("Colisão com jogador e resposta selecionada não vazia.");
    if (global.selectedAnswer == global.correctAnswers[global.currentQuestionIndex]) {
        show_debug_message("Resposta correta!");
        // Lógica para resposta correta
        global.boss_vida -= 1; // Diminui a vida do chefão
        show_debug_message("Vida do chefe: " + string(global.boss_vida));

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
            global.all_questions_answered = true;
        }

        // Incrementar respostas corretas no obj_boss_vetor
        with (obj_boss_vetor) {
            respostas_corretas += 1;
        }
    } else {
        show_debug_message("Resposta incorreta.");
        // Lógica para resposta incorreta
        if (!answeredIncorrectly) {
            global.vida -= 1 - 1; // Diminui a vida do jogador
            show_debug_message("Vida do jogador: " + string(global.vida));
            answeredIncorrectly = true; // Marca que já respondeu incorretamente

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

// Limpa answeredIncorrectly após processar a resposta
if (global.selectedAnswer == "") {
    answeredIncorrectly = false;
}

// Verifique se todas as perguntas foram respondidas
if (global.all_questions_answered) {
    with (obj_btnconf) {
        instance_destroy();
    }
}
