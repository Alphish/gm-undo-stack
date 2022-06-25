is_hover = mouse_x >= x && mouse_x < x + width && mouse_y >= y && mouse_y < y + height;

if (is_hover && mouse_check_button_pressed(mb_left)) {
    var new_value = value;
    
    undo_stack_begin_move();
    
    with (obj_DemoGrid) {
        var grid = values;
        for (var i = 0; i < width; i++)
        for (var j = 0; j < height; j++) {
            if (!selection[# i, j])
                continue;
            
            var change = new GridCellChange(grid, i, j, new_value);
            undo_stack_apply_change(change);
        }
    }
    
    undo_stack_complete_move();
}
