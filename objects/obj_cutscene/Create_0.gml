/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Carrega o GIF animado
gif_sprite = sprite_add("sprites/cutscene.GIF", 0, false, 0, 0, -1);

// Verifica se o GIF foi carregado corretamente
if (gif_sprite == -1) {
    show_debug_message("Erro ao carregar o GIF.");
} else {
    sprite_index = gif_sprite;
    image_speed = 1; // Ajuste a velocidade da animação se necessário
}
