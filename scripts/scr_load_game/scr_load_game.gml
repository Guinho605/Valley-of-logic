function scr_load_game() {
    if (file_exists("savegame.sav")) {
        var load_file = file_text_open_read("savegame.sav");

        // Carregar o nome da sala do jogador
        var room_name = file_text_read_string(load_file);
        file_text_readln(load_file);

        // Salvar os dados carregados em variáveis temporárias
        var player_x = file_text_read_real(load_file);
        file_text_readln(load_file);
        var player_y = file_text_read_real(load_file);
        file_text_readln(load_file);
        var player_health = file_text_read_real(load_file);
        file_text_readln(load_file);

        // Fechar o arquivo
        file_text_close(load_file);

        // Converter o nome da sala para o índice da sala
        var room_index = asset_get_index(room_name);

        // Mudar para a sala carregada
        room_goto(room_index);

        // Garantir que as camadas necessárias existam
        if (!layer_exists("Players")) {
            layer_create(0, "Players");
        }

        if (!layer_exists("Transicao")) {
            layer_create(1, "Transicao");
        }

        // Garantir que o obj_player exista e definir suas propriedades
        var obj_player_instance;
        if (!instance_exists(obj_player)) {
            obj_player_instance = instance_create_layer(player_x, player_y, "Players", obj_player);
        } else {
            obj_player_instance = instance_find(obj_player, 0);
            obj_player_instance.x = player_x;
            obj_player_instance.y = player_y;
        }

       
    } else {
        show_message("Nenhum jogo salvo encontrado.");
    }
}
