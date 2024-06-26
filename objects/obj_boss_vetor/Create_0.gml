/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Evento Create do obj_boss
global.boss_vida = 3; // Defina a quantidade de vida do chefe
global.currentQuestionIndex = 0; // Índice da pergunta atual
global.questions = ["Pergunta 1", "Pergunta 2", "Pergunta 3"]; // Array de perguntas
global.correctAnswers = ["A", "B", "C"]; // Array de respostas corretas correspondentes
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









