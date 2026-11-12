// si ya no hay vidas, no se mueve mas
if (global.game_over)
{
    exit;
}

// movimiento horizontal con A (izquierda) y D (derecha)
// 0 sin movimiento, 1 derecha, -1 izquierda
var mov_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));

// asignamos velocidad horizontal
hsp = mov_x * move_speed;

// colision horizontal
if (place_meeting(x + hsp, y, obj_wall))
{
    while (!place_meeting(x + sign(hsp), y, obj_wall))
    {
        x += sign(hsp);
    }
    hsp = 0;
}
x += hsp;

// gravedad
vsp += grav;

// salto con W
if (keyboard_check_pressed(ord("W")) && place_meeting(x, y + 1, obj_wall))
{
    vsp = jump_speed;
}

// colision vertical
if (place_meeting(x, y + vsp, obj_wall))
{
    while (!place_meeting(x, y + sign(vsp), obj_wall))
    {
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;

// sprites y animaciones segun direccion
if (mov_x > 0)
{
    sprite_index = spr_player_right;
    image_speed = 0.5;
}
else if (mov_x < 0)
{
    sprite_index = spr_player_left;
    image_speed = 0.5;
}
else
{
    image_speed = 0;
    image_index = 0;
}

// si el personaje se cayo, muere y pierde una vida
if (!global.muerto && y > room_height)
{
    global.muerto = true;
    global.caido = true;
    global.vidas -= 1;
    if (variable_global_exists("musica_id") && global.musica_id != 0) audio_pause_sound(global.musica_id);

    if (global.vidas > 0)
    {
        // reaparece en el punto inicial
        x = spawn_x;
        y = spawn_y;
        hsp = 0;
        vsp = 0;
        global.caido = false;
        global.muerto = false;
        if (variable_global_exists("musica_id") && global.musica_id != 0) audio_resume_sound(global.musica_id);
    }
    else
    {
        // sin vidas: game over
        global.game_over = true;
        if (variable_global_exists("musica_id") && global.musica_id != 0) audio_pause_sound(global.musica_id);
    }
}

// recoleccion de monedas dibujadas en la capa de tiles "coin"
var tmap = layer_tilemap_get_id("coin");
if (tmap != -1 && !global.caido && !global.muerto)
{
    var tx1 = tilemap_get_cell_x_at_pixel(tmap, bbox_left,  bbox_top);
    var tx2 = tilemap_get_cell_x_at_pixel(tmap, bbox_right - 1, bbox_bottom - 1);
    var ty1 = tilemap_get_cell_y_at_pixel(tmap, bbox_left,  bbox_top);
    var ty2 = tilemap_get_cell_y_at_pixel(tmap, bbox_right - 1, bbox_bottom - 1);

    for (var tx = tx1; tx <= tx2; tx++)
    {
        for (var ty = ty1; ty <= ty2; ty++)
        {
            if (tilemap_get(tmap, tx, ty) != 0)
            {
                tilemap_set(tmap, 0, tx, ty);
                global.monedas += 1;
                global.puntos += 100;
            }
        }
    }
}

// Espinas (tiles): quitar vida si el jugador toca un tile de espinas
var tmap_espinas = layer_tilemap_get_id("espinas");
if (tmap_espinas != -1 && !global.muerto)
{
    var tx = tilemap_get_cell_x_at_pixel(tmap_espinas, x + 16, y + 31);
    var ty = tilemap_get_cell_y_at_pixel(tmap_espinas, x + 16, y + 31);
    // Solo cuenta si el jugador esta en la mitad inferior del tile (caer encima), no al saltar por encima
    if (tilemap_get(tmap_espinas, tx, ty) != 0 && ((y + 31) - (ty * 16)) >= 8)
    {
        global.muerto = true;
        global.caido = true;
        global.vidas -= 1;
        if (variable_global_exists("musica_id") && global.musica_id != 0) audio_pause_sound(global.musica_id);

        if (global.vidas > 0)
        {
            x = spawn_x;
            y = spawn_y;
            hsp = 0;
            vsp = 0;
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

// Espinas (obj_spike): quitar vida al tocar (robusto)
if (!global.muerto && place_meeting(x, y, obj_spike) && vsp >= 0)
{
    global.muerto = true;
    global.caido = true;
    global.vidas -= 1;
    if (variable_global_exists("musica_id") && global.musica_id != 0) audio_pause_sound(global.musica_id);

    if (global.vidas > 0)
    {
        x = spawn_x;
        y = spawn_y;
        hsp = 0;
        vsp = 0;
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

// Transicion a rm_02 al llegar al final de la sala
if (!global.muerto && !global.game_over && x > room_width - 64)
{
    room_goto(rm_02);
}
