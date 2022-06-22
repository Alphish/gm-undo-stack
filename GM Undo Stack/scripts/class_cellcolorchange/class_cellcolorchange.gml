function CellColorChange(grid, cell_x, cell_y, color) : UndoableChange() constructor {
    target_grid = grid;
    target_cell_x = cell_x;
    target_cell_y = cell_y;
    target_color = color;
    previous_color = grid.colors[# cell_x, cell_y];
    
    // prevents performing an action
    // if the new color is the same as the current one, anyway
    static can_apply = function() {
        return target_color != previous_color;
    }
    
    // paints the given cell with the new color
    static apply = function() {
        target_grid.colors[# target_cell_x, target_cell_y] = target_color;
    }
    
    // paints the given cell with the previous color
    static undo = function() {
        self.apply();
        target_grid.colors[# target_cell_x, target_cell_y] = previous_color;
    }
}
