var display_width = width * cell_size;
var display_height = height * cell_size;

if (mouse_x >= x && mouse_x < x + display_width && mouse_y >= y && mouse_y < y + display_height) {
    hover_column = (mouse_x - x) div cell_size;
    hover_row = (mouse_y - y) div cell_size;
} else {
    hover_column = -1;
    hover_row = -1;
}

if (mouse_check_button_pressed(mb_left) && hover_column >= 0) {
    if (!keyboard_check(vk_control))
        ds_grid_clear(selection, false);
    
    selection[# hover_column, hover_row] = !selection[# hover_column, hover_row];
}
