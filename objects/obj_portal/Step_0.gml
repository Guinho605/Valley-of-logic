/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Se está acontecendo a transição, não faço nada
if (global.transicao != false) exit;

switch (estado) {
    case "idle":
        if (global.sala_atual == "SalaInicial") {
            sprite_index = spr_portal;
            image_speed = 1;
            // Colisão com a seta pra cima
            var _player = instance_place(x, y, obj_player);
            if (_player) {
                // Checando se ele apertou a seta
                if (keyboard_check_pressed(vk_up) && saida && !portal_aberto) {
                    estado = "abrindo";
                    // Player no estado de entrar "in"
                    _player.estado = "in";
                    // Define que o portal está aberto
                    portal_aberto = true;
                }
            }
        }
        break;
    
    case "abrindo":
        if (global.sala_atual == "SalaInicial") {
            mudando_sprite(spr_portal_abre);
            image_speed = 1;
            var frameAbrir = 13; // Último frame da animação de abertura
            var frameLoop = 8;   // Frame para o loop

            // Verifica se atingiu o último frame da abertura
            if (image_index >= frameAbrir) {
                image_index = frameLoop; // Volta para o frame de loop
                // Crio a minha transição
                layer_sequence_create("Transicao", obj_player.x, obj_player.y, sq_transicao_in);
            }

            // Verifica se o jogador entrou no portal
            var _player = instance_place(x, y, obj_player);
            if (_player && keyboard_check_pressed(vk_up)) {
                estado = "fechando"; // Transição para o estado de fechamento
            }
        }
        break;
    
    case "fechando":
        if (global.sala_atual == "SalaInicial") {
            mudando_sprite(spr_portal_fecha);
            image_speed = 1;
            // Saindo do fechando
            if (image_index >= image_number - 1) {
                estado = "idle";
                // No evento onde o jogador atravessa o portal e muda de sala
                global.sala_atual = "NovaSala";
                // Iniciar a mudança de sala (se necessário, você pode usar uma função para realmente mudar a sala aqui)
                room_goto(rm_NovaSala);
            }
        }
        break;
}

