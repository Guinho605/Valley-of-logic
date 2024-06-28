/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

camera_set_view_size(view_camera[0],global.view_width,global.view_heigth); 

if (instance_exists(view_target)){
	var x1 = view_target.x - global.view_width / 2;
	var y1 = view_target.y - global.view_heigth / 2; 
	
	x1 = clamp(x1, 0, room_width - global.view_width);
	y1 = clampy(x1, 0, room_height - global.view_heigth);
	
	camera_set_view_pos(view_camera[0], x1, y1);
}