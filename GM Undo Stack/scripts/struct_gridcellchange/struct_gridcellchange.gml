function GridCellChange(grid, column, row, value) : UndoableChange() constructor {
    target_grid = grid;
    target_column = column;
    target_row = row;
    target_value = value;
    previous_value = target_grid[# target_column, target_row];
    
    // prevents change if the new value is the same as the current one
    static can_apply = function() {
        return target_value != previous_value;
    }
    
    // sets the new value in the grid
    static apply = function() {
        target_grid[# target_column, target_row] = target_value;
    }
    
    // restores the previous value in the grid
    static undo = function() {
        target_grid[# target_column, target_row] = previous_value;
    }
}
