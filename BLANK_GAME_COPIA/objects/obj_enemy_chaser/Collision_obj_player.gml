if (!global.muerto)
{
    global.muerto = true;
    global.caido = true;
    global.vidas -= 1;

    if (global.vidas > 0)
    {
        with (obj_player)
        {
            x = spawn_x;
            y = spawn_y;
            hsp = 0;
            vsp = 0;
        }
        global.caido = false;
        global.muerto = false;
    }
    else
    {
        global.game_over = true;
    }
}