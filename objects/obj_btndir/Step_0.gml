// Evento Step de obj_buttonB
if (place_meeting(x, y, obj_player)) {
    global.selectedAnswer = "B";
    isPressed = true;
} else {
    isPressed = false;
}