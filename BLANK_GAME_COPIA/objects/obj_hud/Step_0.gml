if (global.game_over)
{
    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();

    var bw = 220;
    var bh = 50;
    var bx = gui_w / 2 - bw / 2;
    var by = gui_h / 2 + 60;

    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    if (mouse_check_button_pressed(mb_left))
    {
        if (mx >= bx && mx <= bx + bw && my >= by && my <= by + bh)
        {
            global.vidas = 3;
            global.monedas = 0;
            global.puntos = 0;
            global.caido = false;
            global.muerto = false;
            global.game_over = false;
            room_restart();
        }
    }
}