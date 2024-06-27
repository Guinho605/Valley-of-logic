/// @description Desenha um texto com quebra de linha automática
/// @param x A posição x para desenhar o texto
/// @param y A posição y para desenhar o texto
/// @param text O texto a ser desenhado
/// @param width A largura máxima para cada linha

function scr_draw_text_ext_break(x, y, text, width) {
    var words = scr_string_split(text, " ");
    var line = "";
    var line_height = string_height_ext("A", -1, -1);

    for (var i = 0; i < array_length(words); i++) {
        var word = words[i];
        var test_line = line + word + " ";
        
        if (string_width(test_line) > width) {
            draw_text(x, y, line);
            y += line_height;
            line = word + " ";
        } else {
            line = test_line;
        }
    }

    draw_text(x, y, line);
}
