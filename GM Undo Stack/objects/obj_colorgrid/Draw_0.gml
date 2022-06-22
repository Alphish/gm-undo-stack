var width = ds_grid_width(colors);
var height = ds_grid_height(colors);

for (var i = 0; i < width; i++)
for (var j = 0; j < height; j++) {
    var cell_x = x + cell_size * i;
    var cell_y = y + cell_size * j;
    draw_set_color(colors[# i, j]);
    draw_rectangle(cell_x + 1, cell_y + 1, cell_x + cell_size - 2, cell_y + cell_size - 2, false);
}

if (hover_column >= 0) {
    var hover_x = x + hover_column * cell_size;
    var hover_y = y + hover_row * cell_size;
    
    draw_set_color(c_white);
    draw_set_alpha(0.5);
    draw_rectangle(hover_x + 1, hover_y + 1, hover_x + cell_size - 2, hover_y + cell_size - 2, false);
}

draw_set_color(c_white);
draw_set_alpha(1);
