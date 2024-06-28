/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Evento Create do obj_boss
global.boss_vida = 3; // Defina a quantidade de vida do chefe
global.boss_alive = true;
global.currentQuestionIndex = 0; // Índice da pergunta atual
global.questions = [
   "Se você tem o vetor A = [1, 2] e o vetor B = [3, 4], qual é a soma dos vetores A + B?                   A) [4, 6]         B) [2, 6] ", 
   "Se você tem o vetor C = [5, 6] e subtrai o vetor D = [2, 1], qual é o resultado da subtração C - D?     A) [3, 5]         B) [7, 5]", 
   "Se você tem o vetor E = [1, 2] e o vetor F = [3, 5], qual é a soma dos vetores G + H?                   A) [5, 8]         B) [4, 7]"
];
global.correctAnswers = ["A", "A", "B"]; // As respostas corretas correspondentes às perguntas
global.currentQuestion = global.questions[global.currentQuestionIndex]; // Pergunta atual

/// Evento Create do obj_boss_vetor

respostas_corretas = 0; // Inicializa o contador de respostas corretas
hit_timer = 0; // Inicializa o temporizador de hit
sprite_index = spr_boss_vetor_idle; // Salva a sprite normal do chefe
death_timer = undefined; // Inicializa o temporizador de morte
missil_timer = 0; // Temporizador para controlar o cooldown inicializado para 0
global.missiles_active = 0; // Inicializa o contador de mísseis ativos
missil_cooldown = room_speed * 10; // Tempo inicial de cooldown (exemplo: 2 segundos)
cooldown_duration = room_speed * 10; // Duração do cooldown em segundos (exemplo: 2 segundos)
missile_ready = true; // Indica se um novo míssil pode ser lançado









