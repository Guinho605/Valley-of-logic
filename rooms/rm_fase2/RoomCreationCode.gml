//criando o objeto gamecontrol
//se não existe um objeto game control
if(!instance_exists(obj_game_control))
{
instance_create_depth(0,0,0, obj_game_control);
}