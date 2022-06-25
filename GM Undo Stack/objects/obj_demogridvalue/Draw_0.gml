draw_set_color(is_hover ? c_white : c_silver);
draw_set_alpha(1);
draw_rectangle(x + 2, y + 2, x + width - 3, y + height - 3, false);

draw_set_color(c_black);
draw_set_alpha(1);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x + width div 2, y + height div 2, value);

draw_set_color(c_white);
draw_set_alpha(1);
