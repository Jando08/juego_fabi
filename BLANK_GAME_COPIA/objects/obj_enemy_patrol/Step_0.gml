vsp += grav;
hsp = move_dir * move_speed;

if (place_meeting(x + hsp, y, obj_wall))
{
    while (!place_meeting(x + sign(hsp), y, obj_wall)) x += sign(hsp);
    hsp = 0;
    move_dir *= -1;
}
x += hsp;

if (place_meeting(x, y + vsp, obj_wall))
{
    while (!place_meeting(x, y + sign(vsp), obj_wall)) y += sign(vsp);
    vsp = 0;
}
y += vsp;

if (x <= 0 || x >= room_width - sprite_width) move_dir *= -1;