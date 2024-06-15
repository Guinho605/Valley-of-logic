/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Evento de Colisão entre obj_shoot e obj_inimigo_pai
if (other.object_index == obj_inimigo_pai || object_get_parent(other.object_index) == obj_inimigo_pai) {
    other.dano = true;  // Marca o inimigo como recebendo dano
    other.morto = true; // Marca o inimigo como morto
	other.velh = 0; // Zera a velocidade horizontal
    other.velv = 0; // Zera a velocidade vertical
    // Destruir o tiro após colidir com o inimigo
    instance_destroy(); // Destruir o tiro
}






