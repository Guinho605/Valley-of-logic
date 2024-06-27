/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
 switch (index)
    {
        case 0: // Novo Jogo
            // Coloque aqui o código para iniciar um novo jogo
            room_goto(rm_tutorial01); // Exemplo de mudar para a sala do jogo
            break;
        case 1: // Carregar Jogo
            scr_load_game();
            break;
        case 2: // Opções
            // Coloque aqui o código para abrir o menu de opções
			room_goto(rm_opcoes);
            break;
        case 3: // Sair
            game_end();
            break;
    }










