/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


// Variáveis de estado do portal
estado = "idle";
sprite_index = spr_portal;
image_speed = 1;
portal_aberto = false;
global.transicao = false; // Inicializa a variável global de transição
// Inicializa a variável global sala_atual se ainda não foi inicializada
if (!variable_global_exists("sala_atual")) {
    global.sala_atual = "SalaInicial";
}

