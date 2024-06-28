/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if(keyboard_check_pressed(vk_enter)){
	index++;
	index_letra = 1;
	if(index >= array_length(texto)){
		instance_destroy();
	}
}
