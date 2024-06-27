/// @description Divide uma string em palavras usando um delimitador
/// @param text A string a ser dividida
/// @param delimiter O delimitador para dividir as palavras
/// @return Um array de palavras

function scr_string_split(text, delimiter) {
    var words = [];
    var start = 1;
    var pos = string_pos(delimiter, text);

    while (pos != 0) {
        array_push(words, string_copy(text, start, pos - start));
        start = pos + 1;
        pos = string_pos_ext(delimiter, text, start); // Use string_pos_ext aqui
    }

    array_push(words, string_copy(text, start, string_length(text) - start + 1));

    return words;
}
