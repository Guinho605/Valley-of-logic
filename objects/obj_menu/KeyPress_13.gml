/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
 switch (index)
    {
        case 0: // Novo Jogo
            // Coloque aqui o código para iniciar um novo jogo
            room_goto(rm_video); // Exemplo de mudar para a sala do jogo
            break;
        case 1: // Carregar Jogo
            scr_load_game();
            break;
        case 2: // Sair
            game_end();
            break;
    }










