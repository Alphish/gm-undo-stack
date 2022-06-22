/// @func undo_stack_create()
/// @desc Creates the undo stack controller instance.
/// @returns {Undefined}
function undo_stack_create() {
    instance_create_depth(0, 0, 0, ctrl_UndoStack);
}

/// @func undo_stack_destroy()
/// @desc Destroys the undo stack controller instance.
/// @returns {Undefined}
function undo_stack_destroy() {
    instance_destroy(ctrl_UndoStack);
}

/// @func undo_stack_begin_move()
/// @desc Begins the next undoable move.
/// @returns {Undefined}
function undo_stack_begin_move() {
    with (instance_single(ctrl_UndoStack)) {
        inner_stack.begin_move();
    }
}

/// @func undo_stack_apply_change(change)
/// @desc Applies the given undoable change within the current move.
/// @param {Struct.UndoableChange} change
/// @returns {Undefined}
function undo_stack_apply_change(change) {
    with (instance_single(ctrl_UndoStack)) {
        inner_stack.apply_change(change);
    }
}

/// @func undo_stack_undo()
/// @desc Undoes the last non-empty move.
/// @returns {Undefined}
function undo_stack_undo() {
    with (instance_single(ctrl_UndoStack)) {
        inner_stack.undo_move();
    }
}

/// @func undo_stack_undo_all()
/// @desc Undoes all of the steps so far.
/// @returns {Undefined}
function undo_stack_undo_all() {
    with (instance_single(ctrl_UndoStack)) {
        inner_stack.undo_all();
    }
}

/// @func undo_stack_redo()
/// @desc Redoes the last undone move (if not overwritten).
/// @returns {Undefined}
function undo_stack_redo() {
    with (instance_single(ctrl_UndoStack)) {
        inner_stack.redo_move();
    }
}

/// @func undo_stack_redo_all()
/// @desc Redoes all the undone moves (the ones that weren't overwritten).
/// @returns {Undefined}
function undo_stack_redo_all() {
    with (instance_single(ctrl_UndoStack)) {
        inner_stack.redo_all();
    }
}
