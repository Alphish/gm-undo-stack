function RowRemoveChange(grid) : UndoableChange() constructor {
    target_grid = grid;
    
    var width = ds_grid_width(target_grid);
    var height = ds_grid_height(target_grid);
    removed_items = [];
    for (var i = 0; i < width; i++) {
        array_push(removed_items, target_grid[# i, height - 1]);
    }
    
    static apply = function() {
        var width = ds_grid_width(target_grid);
        var target_height = ds_grid_height(target_grid) - 1;
        ds_grid_resize(target_grid, width, target_height);
    }
    
    static undo = function() {
        var width = ds_grid_width(target_grid);
        var target_height = ds_grid_height(target_grid) + 1;
        ds_grid_resize(target_grid, width, target_height);
        for (var i = 0; i < width; i++) {
            target_grid[# i, target_height - 1] = removed_items[i];
        }
    }
}
