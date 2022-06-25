width = 10;
height = 10;

values = ds_grid_create(width, height);
ds_grid_clear(values, "");
selection = ds_grid_create(width, height);
ds_grid_clear(selection, false);

cell_size = 64;

hover_column = -1;
hover_row = -1;
