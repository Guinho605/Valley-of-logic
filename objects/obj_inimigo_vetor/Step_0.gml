/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (morto) 
{
	sprite_index = spr_inimigo_vetor_dead;
	//sumindo se acabou a animação
	if (image_speed <= 0)
	{
		image_alpha -= 0.01;
	}
	//se ele sumir ele se destroi
	if (image_alpha <= 0)
	{
		instance_destroy();
	}
	exit;
}
//chcando se o inimigo esta no chão
var _chao = place_meeting(x, y + 1, obj_chao);


if(_chao)
{
	//se estou no chão diminuir o tempo de decisão
	tempo_decidir_andar -= 1;
	//se o tempo acabar decidir para onde ir
	if (tempo_decidir_andar <= 0){
		andando = choose(true, false);
		//Escolhendo direção se ele decidiu andar
		if(andando){
			velh = choose(vel, -vel);
		}
		else{
			velh = 0;	
		}
		//resetando tempo
		tempo_decidir_andar = room_speed * 2;
	}

	
	//Controlando a animação
	if(velh != 0 && dano == false)
	{
		sprite_index = spr_inimigo_vetor_run;
		image_xscale = sin(velh);
	}
	else
	{
		sprite_index = spr_inimigo_vetor_idle;
	}
	
	
	//se bater na parede ele muda de direção
	if (place_meeting(x + velh, y, obj_chao))
	{
		velh *= -1;
	}
	
	//se não pode cair, mudar direção
	if(pode_cair == false)
	{
	if(place_meeting(x + (velh * 10), y + 1, obj_chao)==false)
	{
	//se eu não posso cair e não estou tocando no chão na frente, então mudo direção
		velh *= -1;
	}
	}
} 
else
{
	//Se eu não estou no chão eu aplico a gravidade
	velv += grav;
	
	//velh = 0;
	if (velh != 0)
	{
		image_xscale = sin(velh);
	}
}

//checando o dano
if (dano && morto == false)
{
	sprite_index = spr_inimigo_vetor_dano;	
	velh = 0;
}
	





