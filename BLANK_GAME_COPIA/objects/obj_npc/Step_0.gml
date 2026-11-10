var pl = instance_nearest(x, y, obj_player);
if (pl != noone)
{
    var dist = point_distance(x, y, pl.x, pl.y);
    if (dist < trigger_dist)
    {
        if (!dialogue_active)
        {
            dialogue_active = true;
            dialogue_index = 0;
        }
        // Avanzar dialogo con Enter o Espacio
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space))
        {
            dialogue_index += 1;
            if (dialogue_index >= dialogue_count)
            {
                dialogue_active = false;
                dialogue_index = 0;
            }
        }
    }
    else
    {
        dialogue_active = false;
        dialogue_index = 0;
    }
}