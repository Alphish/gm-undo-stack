draw_set_color(color);
draw_set_alpha(1);
draw_rectangle(x + 2, y + 2, x + width - 3, y + height - 3, false);

if (is_hover) {
    draw_set_color(c_white);
    draw_set_alpha(0.5);
    draw_rectangle(x + 2, y + 2, x + width - 3, y + height - 3, false);
}

if (is_active) {
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_rectangle(x, y, x + width - 1, y + height - 1, true);
}

draw_set_color(c_white);
draw_set_alpha(1);
