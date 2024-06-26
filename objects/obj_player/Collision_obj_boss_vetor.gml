/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Evento de colisão entre obj_player e obj_boss
if (estado == "normal") {
    if (posso_perder_vida) {
        global.vida -= 1; // Diminui a vida do jogador
		sprite_index = spr_player_hit;
        posso_perder_vida = false; // Jogador não pode perder vida imediatamente de novo
        inv_timer = inv_tempo; // Inicia o tempo de invulnerabilidade
        if (global.vida <= 0) {
            estado = "dead"; // Muda o estado do jogador para "dead"
			velv = 0;
			velh = 0;
            sprite_index = spr_player_dead; // Define a sprite do jogador morto, se existir
        } else {
            timer_dano = tempo_dano; // Inicia o temporizador de dano
        }
    }
}


