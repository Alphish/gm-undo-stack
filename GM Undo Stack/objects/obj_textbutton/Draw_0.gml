draw_set_color(c_white);
draw_set_alpha(is_hover ? 0.4 : 0.2);
draw_rectangle(x, y, x + width - 1, y + height - 1, false);

draw_set_alpha(is_hover ? 1 : 0.5);
draw_rectangle(x, y, x + width - 1, y + height - 1, true);

draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x + width div 2, y + height div 2, text);

draw_set_color(c_white);
draw_set_alpha(1);
