/// @description Lógica para disparar mísseis em direção ao jogador com limitação de trajetória horizontal

// Verifica se o boss deve morrer
if (global.boss_vida <= 0) {
    // Muda para a sprite de morte
    sprite_index = spr_boss_vetor_dead;
    // Define que o boss está morto
    global.boss_alive = false;
    // Verifica se a animação de morte terminou
    if (image_index >= image_number - 1) {
        // Código adicional para destruir todos os mísseis
        with (obj_missil) {
            instance_destroy(); // Destroi todos os mísseis ativos
        }
        instance_destroy(); // Destroi o objeto do boss

        // Habilita o portal após a morte do boss
        with (obj_portal) {
            saida = true; // Permite que o jogador entre no portal
        }
    }
} else {
    global.boss_alive = true; // Boss está vivo
}

// Atualiza o temporizador de hit
if (hit_timer > 0) {
    hit_timer--;
    if (hit_timer <= 0) {
        sprite_index = spr_boss_vetor_idle; // Retorna à sprite normal do boss
    }
}

// Defina a distância horizontal mínima para o boss atirar o míssil
var trigger_distance = 200; // Ajuste conforme necessário

// Lógica para atirar mísseis
if (global.boss_vida > 0) { // Verifica se o boss ainda está vivo antes de disparar mísseis
    if (global.missiles_active == 0 && missile_ready) {
        var player_x = obj_player.x;
        var boss_x = x;
        
        // Verifica se o jogador está próximo o suficiente
        if (abs(player_x - boss_x) <= trigger_distance) {
            // Criar o míssil
            var missil;
            if (layer_exists("Instances")) {
                missil = instance_create_layer(x, y, "Instances", obj_missil);
            } else {
                missil = instance_create_depth(x, y, 0, obj_missil);
            }
            
            if (missil != noone) {
                missil.target = obj_player;
                missil.speed = 3;
                // Restante do código para configurar o míssil, se necessário
            } else {
                show_debug_message("Erro: Não foi possível criar o míssil!");
            }
            
            // Incrementa o contador de mísseis ativos
            global.missiles_active++;
            
            // Iniciar o cooldown
            missile_ready = false;
            alarm[0] = missil_cooldown; // Define um alarme para o fim do cooldown
        }
    }
}

// Alarme para indicar o fim do cooldown
if (alarm[0] > 0) {
    alarm[0]--;
} else {
    missile_ready = true; // Cooldown terminou, novo míssil pode ser lançado
    
    // Reinicia o cooldown
    alarm[0] = room_speed * 3; // Aumenta o cooldown para 3 segundos (exemplo)
}

// Verifica se todos os mísseis foram destruídos para iniciar o cooldown
if (global.missiles_active == 0 && missil_timer == 0) {
    missil_timer = missil_cooldown;
}

// Função para iniciar o cooldown após um míssil ser destruído
start_missile_cooldown = function() {
    global.missiles_active--;
    if (global.missiles_active == 0) {
        missil_timer = missil_cooldown;
    }
}
