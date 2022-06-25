for (var i = 0; i < width; i++)
for (var j = 0; j < height; j++) {
    var cell_x = x + cell_size * i;
    var cell_y = y + cell_size * j;
    
    draw_set_color(selection[# i, j] ? c_white : c_silver);
    draw_rectangle(cell_x + 1, cell_y + 1, cell_x + cell_size - 2, cell_y + cell_size - 2, false);
    
    draw_set_color(c_black);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(cell_x + cell_size div 2, cell_y + cell_size div 2, values[# i, j]);
}

draw_set_color(c_white);
draw_set_alpha(1);
