if (mouse_check_button_pressed(mb_left)) {
    // beginning a new undoable step with a given LMB press
    // the undo stack system ensures that there won't be a bunch of empty steps
    // by adding a new step if and only if the previous one has some undoable actions
    undo_stack_begin_move();
}
