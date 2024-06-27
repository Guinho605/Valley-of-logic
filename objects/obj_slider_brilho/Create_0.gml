/// Evento Create do obj_slider_brilho
largura_slider = 350; // Defina a largura do slider conforme necessário

// Defina o brilho inicial para 20% de escurecimento (80% de iluminação)
global.brilho = 0.5;


// Calcule a posição inicial do slider com base no brilho inicial
posicao_slider = largura_slider * global.brilho;

is_dragging = false;
