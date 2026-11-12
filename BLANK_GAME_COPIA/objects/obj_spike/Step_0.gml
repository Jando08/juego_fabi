// Verificacion robusta de colision con el jugador
if (place_meeting(x, y, obj_player))
{
    if (!global.muerto)
    {
        global.muerto = true;
        global.caido = true;
        global.vidas -= 1;
        if (variable_global_exists("musica_id") && global.musica_id != 0) audio_pause_sound(global.musica_id);

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
            if (variable_global_exists("musica_id") && global.musica_id != 0) audio_resume_sound(global.musica_id);
        }
        else
        {
            global.game_over = true;
            if (variable_global_exists("musica_id") && global.musica_id != 0) audio_pause_sound(global.musica_id);
        }
    }
}