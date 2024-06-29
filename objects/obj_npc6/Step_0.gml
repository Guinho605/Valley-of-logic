/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (distance_to_object(obj_player) <= 35){
	if(keyboard_check_pressed(ord("F"))){
		var dialogo = instance_create_layer(0,0,"Jogo",obj_dialogo);
		for (var i = 0;i < array_length(texto);i++){
			array_push(dialogo.texto,texto[i]);
		}
	}
}