// Evento Step de obj_buttonA
if (place_meeting(x, y, obj_player)) {
    global.selectedAnswer = "A";
    isPressed = true;
} else {
    isPressed = false;
}