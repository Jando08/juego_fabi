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
