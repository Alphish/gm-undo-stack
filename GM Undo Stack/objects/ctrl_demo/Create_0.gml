color_picked = c_gray;

// IMPORTANT: An instance of ctrl_UndoStack must be created
// in order to use other undo_stack_* functions
undo_stack_create();
undo_stack_set_max_size(10);

// -----------------
// Creating the grid
// -----------------

instance_create_layer(320, 64, "Instances", obj_DemoGrid);

// ---------------
// Creating values
// ---------------

var values = ["LRM", "IPS", "DOL", "ETC", "WTVR", ""];
var values_count = array_length(values);

for (var i = 0; i < values_count; i++) {
    var xx = 48 + 96 * (i mod 2);
    var yy = 128 + 96 * (i div 2);
    instance_create_layer(xx, yy, "Instances", obj_DemoGridValue, { value: values[i] });
}

// --------------------
// Creating the buttons
// --------------------

var button_width = 128;
var button_height = 32;
var button_x = 128 - button_width div 2;
var button_y = 480;

instance_create_layer(button_x, button_y, "Instances", obj_DemoTextButton, {
    text: "Undo", action: undo_stack_undo, width: button_width, height: button_height,
});
instance_create_layer(button_x, button_y + 40, "Instances", obj_DemoTextButton, {
    text: "Undo all", action: undo_stack_undo_all, width: button_width, height: button_height,
});
instance_create_layer(button_x, button_y + 80, "Instances", obj_DemoTextButton, {
    text: "Redo", action: undo_stack_redo, width: button_width, height: button_height,
});
instance_create_layer(button_x, button_y + 120, "Instances", obj_DemoTextButton, {
    text: "Redo all", action: undo_stack_redo_all, width: button_width, height: button_height,
});
