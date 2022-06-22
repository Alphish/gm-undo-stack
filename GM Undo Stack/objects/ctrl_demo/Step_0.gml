if (keyboard_check(vk_control) && keyboard_check_pressed(ord("Z"))) {
    undo_stack_undo();
}

if (keyboard_check(vk_control) && keyboard_check_pressed(ord("Y"))) {
    undo_stack_redo();
}
