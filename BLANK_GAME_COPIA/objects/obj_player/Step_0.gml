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
    image_speed = 1;
}
else if (mov_x < 0)
{
    sprite_index = spr_player_left;
    image_speed = 1;
}
else
{
    image_speed = 0;
    image_index = 0;
}

// recoleccion de monedas dibujadas en la capa de tiles "coin"
var tmap = layer_tilemap_get_id("coin");
if (tmap != -1)
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
