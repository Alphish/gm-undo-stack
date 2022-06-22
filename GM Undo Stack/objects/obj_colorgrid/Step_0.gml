var width = ds_grid_width(colors);
var height = ds_grid_height(colors);
var display_width = width * cell_size;
var display_height = height * cell_size;

if (mouse_x >= x && mouse_x < x + display_width && mouse_y >= y && mouse_y < y + display_height) {
    hover_column = (mouse_x - x) div cell_size;
    hover_row = (mouse_y - y) div cell_size;
} else {
    hover_column = -1;
    hover_row = -1;
}

if (mouse_check_button(mb_left) && hover_column >= 0) {
    var target_color = instance_single(ctrl_Demo).color_picked;
    var action = new CellColorChange(id, hover_column, hover_row, target_color);
    undo_stack_apply_change(action);
}
