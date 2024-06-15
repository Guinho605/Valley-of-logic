/// Step evento da plataforma
vspd = move_dir * move_spd;

if (instance_place(x, y + sign(vspd), obj_chao)) {
    move_dir *= -1;
}

// Verificação se o jogador está colidindo com a plataforma
var c = place_meeting(x, y + 1, obj_player) or place_meeting(x, y - 1, obj_player);

if (c) {
    with (obj_player) {
        // Move o jogador com a plataforma se não estiver morto
        if (estado != "dead") {
            y += other.vspd;
        }
    }
}

// Atualiza a posição vertical da plataforma
y += vspd;
