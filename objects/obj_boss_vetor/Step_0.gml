/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Verifica se o boss deve morrer
if (global.boss_vida <= 0) {
    // Muda para a sprite de morte
    sprite_index = spr_boss_vetor_dead;
    
    // Verifica se a animação de morte terminou
    if (image_index >= image_number - 1) {
        instance_destroy(); // Destroi o objeto do boss
    }
}
// Atualiza o temporizador de hit
if (hit_timer > 0) {
    hit_timer--;
    if (hit_timer <= 0) {
        sprite_index = spr_boss_vetor_idle; // Retorna à sprite normal do boss
    }
}

// Lógica para atirar mísseis
if (global.missiles_active == 0 && missile_ready) {
    // Criar o míssil
    if (layer_exists("Instances")) {
        var missil = instance_create_layer(x, y, "Instances", obj_missil);
    } else {
        var missil = instance_create_depth(x, y, 0, obj_missil);
    }

    // Definir o alvo do míssil
    missil.target = obj_player;
    missil.speed = 4;
    
    // Incrementa o contador de mísseis ativos
    global.missiles_active++;
    
    // Iniciar o cooldown
    missile_ready = false;
    alarm[0] = missil_cooldown; // Define um alarme para o fim do cooldown
}

// Alarme para indicar o fim do cooldown
if (alarm[0] > 0) {
    alarm[0]--;
} else {
    missile_ready = true; // Cooldown terminou, novo míssil pode ser lançado
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