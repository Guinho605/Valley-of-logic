/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _videoData = video_draw();
var _videoStatus = _videoData[0];

if (_videoStatus == 0) {
    var surf_width = surface_get_width(_videoData[1]);
    var surf_height = surface_get_height(_videoData[1]);
    
    // Define a posição na tela onde o vídeo será desenhado
    var video_x = 0; // Posição X inicial (esquerda)
    var video_y = - 40; // Posição Y ajustada para 50 pixels de cima
    
    // Desenha a superfície de vídeo na tela, ajustando para preencher a tela
    draw_surface_stretched(_videoData[1], video_x, video_y, room_width, room_height);
}
