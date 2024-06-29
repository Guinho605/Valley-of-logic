/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Variáveis globais


velh = 0;
velv = 0;
vel = 4;
grav = .3;
vel_jump = 6;

pulos_extra = 1;


global.answeredIncorrectly = false;


// Inicialize as variáveis necessárias
shoot_cooldown = 0;
shoot_duration = 30; // Duração do disparo (em frames)
shooting = false;
shoot_timer = 0;
cooldown_duration = 5 * room_speed; // Duração do cooldown (5 segundos)

global.bullets = 5;

dash = false; // Estado do dash
dash_duration = room_speed * 0.2; // Duração do dash em segundos
dash_timer = 0; // Temporizador do dash
dash_speed = 8; // Velocidade do dash
dash_cooldown = room_speed * 3; // Tempo de recarga do dash em segundos
dash_cooldown_timer = 0; // Temporizador de recarga do dash

alive = true; // Ou false, dependendo da lógica do seu jogo
dano = false;
tempo_dano = room_speed * 1;
timer_dano = 0;

tempo_reinicia = room_speed * 2;
timer_reinicia = tempo_reinicia;

inv_tempo = room_speed * 2;
inv_timer = 0;
posso_perder_vida = true;

estado = "out";
sprite_index = spr_player_out;
image_speed = 0;

// criando a transição de saída da porta 
layer_sequence_create("Transicao", x, y, sq_transicao_out);
inputs = {
    left : ord("A"),  
    right : ord("D"),
    jump : vk_space,
    dash: vk_control,

};

estado_normal = function() {
    image_speed = 1;
    var _chao = place_meeting(x, y + 1, obj_chao);
    var _left, _right, _jump, _dash;
    _left = keyboard_check(inputs.left);
    _right = keyboard_check(inputs.right);
    _jump = keyboard_check_pressed(inputs.jump);
    _dash = keyboard_check_pressed(inputs.dash);
	

    // Atualiza o estado do dash
    if (_dash && dash_timer == 0 && dash_cooldown_timer == 0 && timer_dano <= 0) {
        dash = true;
        dash_timer = dash_duration;
        dash_cooldown_timer = dash_cooldown; // Inicia o temporizador de recarga do dash
    }

    // Lógica do dash
    if (dash) {
        velh = image_xscale * dash_speed; // Define a velocidade horizontal do dash
        sprite_index = spr_player_dash; // Muda para a sprite de dash durante o dash
        dash_timer--;
        if (dash_timer <= 0) {
            dash = false;
        }
    } else {
        // Só posso me mover se o timer do dano está zerado e não estou dando dash
        if (timer_dano <= 0) {
            velh = (_right - _left) * vel;
        }

        // Pulo
        if (_chao) {
			    // Pulo
	            if (_jump) {
	                velv = -vel_jump;    
	                pulos_extra = 1;
					//obj_SND.sfx_jump.play = true;
	            }
            // Movendo no chão
            if (velh != 0) {
                sprite_index = spr_player_run;
                image_xscale = sign(velh);
				//obj_SND.sfx_walk.play = true;
            } else {
                sprite_index = spr_player_idle;
            }
        } else { // Não está no chão
            if (velv < 0) {
                sprite_index = spr_player_jump;
            } else {
                sprite_index = spr_player_fall;

                // Cair na cabeça do inimigo
                var _inimigo = instance_place(x, y + 1, obj_inimigo_pai);

                // Se cair no inimigo dou dano nele
                if (_inimigo) {
                    dano = false;
                    // Se o inimigo não está morto
                    if (!_inimigo.morto) {
                        // Vou pra cima de novo
                        velv = -vel_jump;
                        _inimigo.dano = true;
                    }
                }
            }

            // Aplicar gravidade
            velv += grav;

            if (_jump && pulos_extra > 0) {
                velv = -vel_jump;
                pulos_extra--; // Reduz a quantidade de pulos extras disponíveis
            }

            if (velh != 0) {
                image_xscale = sign(velh);
            }
        }
    }

    // Lógica de dano
    if (dano) {
        sprite_index = spr_player_hit;    
        velh = 0;
        velv = 0;
        if (posso_perder_vida) {
            global.vida--;
            if (global.vida <= 0) {
                estado = "dead";  
				
            } else {
                posso_perder_vida = false;
            }
        }
		//obj_SND.sfx_dano.play = true;
    }

    // Lógica de estado morto
    if (estado == "dead") {
        if (!_chao) {
            velv = 3;
            velv += grav;
        }
		//obj_SND.sfx_dead.play = true;
		
    }

    // Se o timer do dano é maior que zero, eu diminuo ele
    if (timer_dano > 0) {
        timer_dano--;
    } else {
        dano = false;
        posso_perder_vida = true;
    }

    // Lógica de invulnerabilidade
    if (inv_timer > 0) {
        inv_timer--;
        image_alpha = .5;
    } else {
        image_alpha = 1;
    }
	

    // Lógica de colisão com inimigo durante o dash
    if (dash) {
        var _inimigo_dash = instance_place(x, y, obj_inimigo_pai);
        if (_inimigo_dash) {
            _inimigo_dash.dano = true; // Marca o inimigo para iniciar a animação de morte
			}
    } else {
        // Tomando dano
        var _inimigo = instance_place(x, y, obj_inimigo_pai);
        if (_inimigo && inv_timer <= 0) {
            if (!_inimigo.morto && !_inimigo.dano) {
                dano = true;
                timer_dano = tempo_dano;
                inv_timer = inv_tempo;}}}
    // Reduzir o temporizador de recarga do dash
    if (dash_cooldown_timer > 0) {
        dash_cooldown_timer--;}};

// Chamar a função de estado normal (exemplo)
estado_normal();
//obj_SND.sfx_walk.play = true;