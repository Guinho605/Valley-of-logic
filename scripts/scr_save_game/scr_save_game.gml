function scr_save_game() {
    var save_file = file_text_open_write("savegame.sav");

    // Salvar a sala atual do jogador
    file_text_write_string(save_file, room_get_name(room));
    file_text_writeln(save_file);

    // Salvar posição do jogador
    file_text_write_real(save_file, obj_player.x);
    file_text_writeln(save_file);
    file_text_write_real(save_file, obj_player.y);
    file_text_writeln(save_file);

    // Fechar o arquivo
    file_text_close(save_file);
}

