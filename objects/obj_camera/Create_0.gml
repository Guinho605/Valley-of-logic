/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

resolution_width = 1140;
resolution_heigth = 768;
resolution_scale = 3;

global.view_width = resolution_width / resolution_scale;
global.view_heigth = resolution_heigth / resolution_scale;

view_target = obj_player;

window_set_size(global.view_width * resolution_scale, global.view_heigth * resolution_scale);
surface_resize(application_surface,global.view_width * resolution_scale,global.view_heigth * resolution_scale); 