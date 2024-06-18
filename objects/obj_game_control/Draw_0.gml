/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Evento Draw de obj_game_control

// Desenha a pergunta no centro superior da tela, ajustando a posição
var xPos = (display_get_width() / 2) + 350; // Move um pouco para a direita
var yPos = 150; // Move um pouco para baixo
draw_text(xPos - string_width(global.questionText) / 2, yPos, global.questionText);









