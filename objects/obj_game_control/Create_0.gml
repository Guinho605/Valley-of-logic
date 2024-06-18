/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//método de desenhar o coiração
desenha_coracao = function(_x, _y)
{
	draw_sprite_ext(spr_coracao, 2 * get_timer() / 1000000, _x, _y, 2, 2, 0, c_white, 1);	
}

// Evento Create de obj_game_control
global.selectedAnswer = "";
global.correctAnswer = "A"; // Esta variável será definida pela pergunta atual
global.bossLife = 5; // Exemplo de vida do boss
global.playerLife = 3; // Exemplo de vida do jogador

global.chooseQuestion = function() {
    var question = irandom(1); // Gera um número aleatório entre 0 e 1
    switch (question) {
        case 0:
            global.questionText = "Qual é o resultado de 2 + 2?";
            global.correctAnswer = "B"; // Assumindo que B é 4
            break;
        case 1:
            global.questionText = "Qual é a capital da França?";
            global.correctAnswer = "A"; // Assumindo que A é Paris
            break;
        // Adicione mais perguntas aqui
    }
};

// Chame a função global para definir a pergunta inicial
global.chooseQuestion();











