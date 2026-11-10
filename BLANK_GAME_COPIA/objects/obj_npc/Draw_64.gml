if (dialogue_active)
{
    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();

    var box_h = 100;
    var box_y = gui_h - box_h - 20;
    var box_x = 40;
    var box_w = gui_w - 80;

    // Fondo del cuadro
    draw_set_alpha(0.85);
    draw_set_color(make_color_rgb(25, 30, 40));
    draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, false);
    draw_set_alpha(1);

    // Borde
    draw_set_color(make_color_rgb(255, 205, 55));
    draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, true);

    // Texto
    draw_set_font(fn_hud);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_text(box_x + 16, box_y + 16, dialogue_lines[dialogue_index]);

    // Indicacion
    draw_set_color(make_color_rgb(100, 240, 160));
    draw_set_halign(fa_right);
    draw_text(box_x + box_w - 16, box_y + box_h - 24, "Enter: siguiente");
}