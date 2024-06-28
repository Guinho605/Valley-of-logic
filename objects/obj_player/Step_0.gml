/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Evento Step do obj_player

// Controlando o player
var _chao = place_meeting(x, y + 1, obj_chao);

if (global.transicao != false) exit;

switch(estado) {
    case "normal":
        estado_normal();
        break;

    case "in":
        mudando_sprite(spr_player_in);

        // Terminou a animação, para ela
        var _img_vel = sprite_get_speed(sprite_index) / room_speed;
		//obj_SND.sfx_walk.play = true;
        // Indo para o estado normal
        if(image_index >= image_number - _img_vel) {
            image_speed = 0;
            image_index = image_number - 1;
            image_alpha = 0;
        }
        break;

    case "out":
        mudando_sprite(spr_player_out);
        var _img_vel = sprite_get_speed(sprite_index) / room_speed;
        // Indo para o estado normal
        if(image_index >= image_number - _img_vel) {
            estado = "normal";    
        }
        break;


// Dentro do seu switch case
case "dead":
    mudando_sprite(spr_player_dead);
	//instance_create_layer(x,y,layer, obj_player);
	//var som = choose(sd_deadPlayer);
	//audio_play_sound(som, 2, false);
    timer_reinicia--;

    // Reinicializar as vidas quando o timer de reinício chegar a zero
    if (timer_reinicia <= 0) {
        global.vida = global.max_vida; // Reinicializar vidas
        velh = 0; // Parar movimento horizontal
        velv = 0; // Zerar a velocidade vertical para começar a queda
        y += 1; // Mova um pixel para forçar o jogador a sair do chão (opcional)
        estado = "normal"; // Ou outro estado inicial desejado após reiniciar
        room_restart(); // Reiniciar a sala
    } else {
        // Aplicar gravidade para que o jogador caia
        velv += grav;
        y += velv; // Atualizar a posição vertical do jogador com base na velocidade vertical
    }

    // Ficar visível gradualmente
    if (image_alpha < 1) {
        image_alpha += 0.01;
    }

    // Parar animação quando chegar ao fim
    if (image_index > image_number - 1) {
        image_speed = 0;
        image_index = image_number - 1;
    }
    break;

}


/// Verificação do disparo
var key_shoot = keyboard_check_pressed(ord("X"));

#region Tiro

if (shoot_cooldown <= 0 && key_shoot) {
    // Ajuste a posição do tiro com base na posição do personagem e seu sprite
    var gun_x = x + (image_xscale - 13); // Ajuste a posição horizontal
    var gun_y = y - sprite_height * 0.6; // Ajuste a posição vertical

    // Ajuste adicional para corrigir a posição do tiro ao atirar para a esquerda
    if (image_xscale == -1) {
        gun_x = x + 24; // Ajuste este valor conforme necessário
        gun_y = y - sprite_height * 0.6 + 14; // Ajuste este valor conforme necessário
    }

    // Criar o tiro
    var tiro = instance_create_layer(gun_x, gun_y, "Shoot", obj_shoot);
    with (tiro) {
        speed = 10;
        direction = 0; // Direção horizontal baseada na escala do personagem
        if (other.image_xscale == -1) {
            direction = 180; // Ajusta a direção se o personagem estiver virado para a esquerda
        }
        image_angle = direction;

        // Define a variável shooting como verdadeira para ativar a troca de sprite
        obj_player.shooting = true;
        obj_player.shoot_timer = obj_player.shoot_duration; // Define o temporizador de disparo
    }

    // Iniciar o cooldown
    shoot_cooldown = cooldown_duration;
}

// Verificar se o jogador está atirando
if (shooting) {
    // Trocar a sprite do jogador para a sprite de disparo
    sprite_index = spr_player_shoot;

    // Reduzir o temporizador de disparo
    obj_player.shoot_timer--;

    // Voltar para a sprite normal após a duração do disparo
    if (obj_player.shoot_timer <= 0) {
        shooting = false;
        sprite_index = spr_player_idle; // Mudar para a sprite padrão ou qualquer outra sprite
    }
}

// Reduzir o cooldown se for maior que 0
if (shoot_cooldown > 0) {
    shoot_cooldown--;
}

#endregion

// Evento Step de obj_player

if (room == rm_boss && x >= 700) { // Verifique se o jogador está na sala do chefe e atingiu a posição x >= 350
    global.playerAtPoint = true;
}


