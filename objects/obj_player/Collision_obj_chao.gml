/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

/// Evento de colisão entre obj_player e obj_parede_movel_vert
if (place_meeting(x, y + 3, obj_parede_movel_vert)) {
    // Esmagado pela parte de cima da plataforma
    estado = "dead";
	velh = 0;
	vel = 0;
} else if (place_meeting(x, y - 3, obj_parede_movel_vert)) {
    // Esmagado pela parte de baixo da plataforma
    estado = "dead";
	velh = 0;
	vel = 0;
}

global.vida = 0;








