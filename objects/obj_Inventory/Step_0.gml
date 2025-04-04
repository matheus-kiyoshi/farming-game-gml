if (keyboard_check_pressed(ord("E"))) {
    InvOpen = !InvOpen;
}

if (keyboard_check_pressed(ord("1"))) { HotBarSelect = 0; }
else if (keyboard_check_pressed(ord("2"))) { HotBarSelect = 1; }
else if (keyboard_check_pressed(ord("3"))) { HotBarSelect = 2; }
else if (keyboard_check_pressed(ord("4"))) { HotBarSelect = 3; }
else if (keyboard_check_pressed(ord("5"))) { HotBarSelect = 4; }

// Scroll
if mouse_wheel_up() {
    if (HotBarSelect > 0) {
        HotBarSelect--;
    } else {
        HotBarSelect = InvWidth - 1;
    }
} else if mouse_wheel_down() {
    if (HotBarSelect < InvWidth - 1) {
        HotBarSelect++;
    } else {
        HotBarSelect = 0
    }
}
