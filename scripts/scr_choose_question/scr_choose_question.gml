// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_choose_question(){
// Script scr_choose_question
global.questionText = "";
global.correctAnswer = "";

function chooseQuestion() {
    var question = irandom(1); // Altere o intervalo conforme o número de perguntas disponíveis
    switch (question) {
        case 0:
            global.questionText = "Qual é o resultado de 2 + 2?";
            global.correctAnswer = "B"; // Assumindo que B é 4
            break;
        case 1:
            global.questionText = "Qual é a capital da França?";
            global.correctAnswer = "A"; // Assumindo que A é Paris
            break;
        // Adicione mais perguntas aqui
    }
}

}