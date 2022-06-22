is_hover = mouse_x >= x && mouse_x < x + width && mouse_y >= y && mouse_y < y + height;

if (is_hover && mouse_check_button_pressed(mb_left)) {
    with (ctrl_Demo) {
        color_picked = other.color;
    }
}
