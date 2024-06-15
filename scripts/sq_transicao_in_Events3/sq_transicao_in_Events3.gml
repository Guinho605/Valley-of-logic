// Auto-generated stubs for each available event.

function sq_transicao_in_Moment()
{
	global.transicao = true;
	//se existe uma proxima room eu vou para ela
	if (room_next(room) != -1)
	{
	room_goto_next();
	}
	//caso contrário eu começo o jogo denovo
	else
	{
		room_goto(rm_tutorial01);
	}
}