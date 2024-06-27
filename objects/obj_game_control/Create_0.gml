/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//método de desenhar o coração
desenha_coracao = function(_x, _y)
{
    draw_sprite_ext(spr_coracao, 2 * get_timer() / 1000000, _x, _y, 2, 2, 0, c_white, 1);    
}

// Evento Create de obj_gameController
global.selectedAnswer = ""; // Inicialize como uma string vazia
global.vida = 3; // Exemplo de inicialização de outras variáveis globais
global.boss_vida = 3; // Exemplo de inicialização da vida do chefe
// Inicialize as perguntas e as respostas corretas
global.questions = [
    "Se você tem o vetor A = [1, 2] e o vetor B = [3, 4], qual é a soma dos vetores A + B?                   A) [4, 6]         B) [2, 6] ", 
    "Se você tem o vetor C = [5, 6] e subtrai o vetor D = [2, 1], qual é o resultado da subtração C - D?     A) [3, 5]         B) [7, 5]", 
    "Se você tem o vetor E = [1, 2] e o vetor F = [3, 5], qual é a soma dos vetores G + H?                   A) [5, 8]         B) [4, 7]"
];
global.correctAnswers = ["A", "A", "B"]; // Supondo que "A" é a resposta correta para a França e a Itália, e "B" para a Alemanha
global.currentQuestionIndex = 0; // Índice da pergunta atual
global.currentQuestion = global.questions[global.currentQuestionIndex]; // Pergunta atual
global.all_questions_answered = false;