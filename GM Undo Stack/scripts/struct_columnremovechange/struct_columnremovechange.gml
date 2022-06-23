function ColumnRemoveChange(grid) : UndoableChange() constructor {
    target_grid = grid;
    
    var width = ds_grid_width(target_grid);
    var height = ds_grid_height(target_grid);
    removed_items = [];
    for (var i = 0; i < height; i++) {
        array_push(removed_items, target_grid[# width - 1, i]);
    }
    
	// shrinks the grid by one column, losing its cell colours in the process
    static apply = function() {
        var target_width = ds_grid_width(target_grid) - 1;
        var height = ds_grid_height(target_grid);
        ds_grid_resize(target_grid, target_width, height);
    }
    
	// regrows the grid, restoring the cell colours from the earlier removed columns
    static undo = function() {
        var target_width = ds_grid_width(target_grid) + 1;
        var height = ds_grid_height(target_grid);
        ds_grid_resize(target_grid, target_width, height);
        for (var i = 0; i < height; i++) {
            target_grid[# target_width - 1, i] = removed_items[i];
        }
    }
}
