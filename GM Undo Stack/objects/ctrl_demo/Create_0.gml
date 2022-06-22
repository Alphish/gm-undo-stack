color_picked = c_gray;

// IMPORTANT: An instance of ctrl_UndoStack must be created
// in order to use other undo_stack_* functions
undo_stack_create();

// -----------------
// Creating the grid
// -----------------

instance_create_layer(256, 0, "Instances", obj_ColorGrid);

// ----------------------
// Creating color pickers
// ----------------------

instance_create_layer(48, 48, "Instances", obj_ColorPicker, {
    width: 64, height: 64, color: c_gray,
});
instance_create_layer(144, 48, "Instances", obj_ColorPicker, {
    width: 64, height: 64, color: c_red,
});
instance_create_layer(48, 144, "Instances", obj_ColorPicker, {
    width: 64, height: 64, color: c_lime,
});
instance_create_layer(144, 144, "Instances", obj_ColorPicker, {
    width: 64, height: 64, color: c_blue,
});

// --------------------
// Creating the buttons
// --------------------

var button_width = 128;
var button_height = 32;
var button_x = 128 - button_width div 2;
var button_y = 320;

instance_create_layer(button_x, button_y, "Instances", obj_TextButton, {
    text: "Add column", width: button_width, height: button_height, action: function() {
        var grid = instance_single(obj_ColorGrid).colors;
        if (ds_grid_width(grid) >= 20)
            return;
        
        var change = new ColumnAddChange(grid);
        undo_stack_apply_change(change);
        undo_stack_begin_move();
    }
});
instance_create_layer(button_x, button_y + 40, "Instances", obj_TextButton, {
    text: "Remove column", width: button_width, height: button_height, action: function() {
        var grid = instance_single(obj_ColorGrid).colors;
        if (ds_grid_width(grid) <= 5)
            return;
        
        var change = new ColumnRemoveChange(grid);
        undo_stack_apply_change(change);
        undo_stack_begin_move();
    }
});
instance_create_layer(button_x, button_y + 80, "Instances", obj_TextButton, {
    text: "Add row", width: button_width, height: button_height, action: function() {
        var grid = instance_single(obj_ColorGrid).colors;
        if (ds_grid_height(grid) >= 20)
            return;
        
        var change = new RowAddChange(grid);
        undo_stack_apply_change(change);
        undo_stack_begin_move();
    }
});
instance_create_layer(button_x, button_y + 120, "Instances", obj_TextButton, {
    text: "Remove row", width: button_width, height: button_height, action: function() {
        var grid = instance_single(obj_ColorGrid).colors;
        if (ds_grid_height(grid) <= 5)
            return;
        
        var change = new RowRemoveChange(grid);
        undo_stack_apply_change(change);
        undo_stack_begin_move();
    }
});

button_y = 520;

instance_create_layer(button_x, button_y, "Instances", obj_TextButton, {
    text: "Undo", action: undo_stack_undo, width: button_width, height: button_height,
});
instance_create_layer(button_x, button_y + 40, "Instances", obj_TextButton, {
    text: "Undo all", action: undo_stack_undo_all, width: button_width, height: button_height,
});
instance_create_layer(button_x, button_y + 80, "Instances", obj_TextButton, {
    text: "Redo", action: undo_stack_redo, width: button_width, height: button_height,
});
instance_create_layer(button_x, button_y + 120, "Instances", obj_TextButton, {
    text: "Redo all", action: undo_stack_redo_all, width: button_width, height: button_height,
});
