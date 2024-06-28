/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Verifica se o GIF terminou de ser exibido
if (image_index >= sprite_get_number(sprite_index) - 1) {
    // Ações após o GIF terminar
    if (sprite_exists(gif_sprite)) {
        sprite_delete(gif_sprite);
    }
    room_goto_next(); // Ou qualquer outra ação que deseja executar após a cutscene
}
