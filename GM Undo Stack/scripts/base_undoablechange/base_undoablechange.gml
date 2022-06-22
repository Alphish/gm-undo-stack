function UndoableChange() constructor {
    
    /// @func can_apply()
    /// @desc Determines whether a given change can be applied or not.
    /// @returns {Bool}
    static can_apply = function() {
        return true;
    }
    
    /// @func apply()
    /// @desc Applies the given undoable change.
    /// @returns {Undefined}
    static apply = function() {
        throw not_implemented_exception("perform()");
    }
    
    /// @func undo()
    /// @desc Undoes the given undoable change.
    /// @returns {Undefined}
    static undo = function() {
        throw not_implemented_exception("undo()");
    }
}