/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Evento Create do obj_brightness_control
// Inicialize o brilho global, se necessário
/// Evento Create do obj_brightness_control

// Defina o brilho inicial
global.brilho = 0.8; // Pode ser ajustado conforme necessário

// Calcule a posição inicial do slider com base no brilho
largura_slider = 350; // Ajuste conforme necessário
posicao_slider = largura_slider * global.brilho;

is_dragging = false;
