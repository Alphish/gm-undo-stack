function UndoStack() constructor {
    moves = [];
    undone_moves = [];
    begin_move();
    
    /// @func is_empty()
    /// @desc Checks whether the undo stack is empty.
    /// @returns {Bool}
    static is_empty = function() {
        return array_length(moves) == 0;
    }
    
    /// @func begin_move()
    /// @desc Begins a new undoable move.
    /// @returns {Undefined}
    static begin_move = function() {
        if (!is_empty() && get_last_move().is_empty())
            return;
        
        array_push(moves, new UndoableMove());
    }
    
    /// @func apply_change(change)
    /// @desc Tries to apply a given undoable change. The change will clear the redo stack.
    /// @param {Struct.UndoableChange} change
    /// @returns {Undefined}
    static apply_change = function(change) {
        var change_applied = get_last_move().apply_change(change);
        if (!change_applied)
            return;
        
        discard_redoable_moves();
    }
    
    /// @func undo_move()
    /// @desc Undoes the last non-empty move, if any.
    /// @returns {Undefined}
    static undo_move = function() {
        if (get_last_move().is_empty())
            array_pop(moves);
        
        if (array_length(moves) > 0) {
            var undone_move = array_pop(moves);
            undone_move.undo();
            array_push(undone_moves, undone_move);
        }
        
        begin_move();
    }
    
    /// @func undo_all()
    /// @desc Undoes all of the moves so far.
    /// @returns {Undefined}
    static undo_all = function() {
        if (get_last_move().is_empty())
            array_pop(moves);
        
        var moves_count = array_length(moves);
        repeat (moves_count) {
            var undone_move = array_pop(moves);
            undone_move.undo();
            array_push(undone_moves, undone_move);
        }
        
        begin_move();
    }
    
    /// @func redo_move()
    /// @desc Redoes the last undone move, if not overwritten.
    /// @returns {Undefined}
    static redo_move = function() {
        if (array_length(undone_moves) == 0)
            return;
        
        if (get_last_move().is_empty())
            array_pop(moves);
        
        if (array_length(undone_moves) > 0) {
            var redone_move = array_pop(undone_moves);
            redone_move.redo();
            array_push(moves, redone_move);
        }
        
        begin_move();
    }
    
    /// @func redo_all()
    /// @desc Redoes all of the undone moves that weren't overwritten.
    /// @returns {Undefined}
    static redo_all = function() {
        if (get_last_move().is_empty())
            array_pop(moves);
        
        var moves_count = array_length(undone_moves);
        repeat (moves_count) {
            var redone_move = array_pop(undone_moves);
            redone_move.redo();
            array_push(moves, redone_move);
        }
        
        begin_move();
    }
    
    /// @func get_last_move()
    /// @desc Gets the current undoable move.
    /// @returns {Struct.UndoableMove}
    static get_last_move = function() {
        return moves[array_length(moves) - 1];
    }
    
    /// @func discard_redoable_moves()
    /// @desc Discards all the undone moves.
    /// @returns {Undefined}
    static discard_redoable_moves = function() {
        undone_moves = [];
    }
}
