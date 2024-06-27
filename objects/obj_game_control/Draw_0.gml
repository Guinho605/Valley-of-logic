// Ajuste o brilho do jogo
draw_set_alpha(global.brilho);

// Desenha o resto do jogo aqui. Exemplo:
draw_self(); // Desenha o objeto atual se necessário
// Ou desenha outros elementos do jogo, por exemplo:
draw_background(background0, 0, 0);
draw_sprite(sprite_player, 0, player.x, player.y);

// Resetando o alpha
draw_set_alpha(1);
