/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Verifica se o alvo existe e está válido
if (target != noone && instance_exists(target)) {
    // Calcular a direção para o jogador
    var dir = point_direction(x, y, target.x, target.y);

    // Atualizar a posição do míssil
    motion_set(dir, speed);

    // Verificar colisão com o jogador
    if (place_meeting(x, y, target)) {
        with (target) {
            // Lógica para causar dano ao jogador
            sprite_index = spr_player_hit;
            dano = true;
            timer_dano = tempo_dano;
            posso_perder_vida = true;
        }
        instance_destroy(); // Destruir o míssil após atingir o jogador
    }
}

// Verificar se o míssil sai da tela e destruí-lo
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}

// Verifica a direção do movimento e inverte a sprite se necessário
if (speed != 0) {
    if (direction > 90 && direction < 270) {
        // Míssil está indo para a direita
        image_xscale = 1; // Inverte a sprite horizontalmente
    } else {
        // Míssil está indo para a esquerda
        image_xscale = -1; // Mantém a sprite normal
    }
}

// Adicionar no Step Event do obj_missil
show_debug_message("Missil X: " + string(x) + " Y: " + string(y) + " | Target X: " + string(target.x) + " Y: " + string(target.y));
