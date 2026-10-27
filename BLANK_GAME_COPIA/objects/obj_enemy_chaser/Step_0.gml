var pl = instance_nearest(x, y, obj_player);
if (pl != noone)
{
    var dist = point_distance(x, y, pl.x, pl.y);
    if (dist < chase_range)
    {
        if (pl.x > x) hsp = move_speed;
        else if (pl.x < x) hsp = -move_speed;
        else hsp = 0;
    }
    else hsp = 0;
}

vsp += grav;

if (place_meeting(x + hsp, y, obj_wall))
{
    while (!place_meeting(x + sign(hsp), y, obj_wall)) x += sign(hsp);
    hsp = 0;
}
x += hsp;

if (place_meeting(x, y + vsp, obj_wall))
{
    while (!place_meeting(x, y + sign(vsp), obj_wall)) y += sign(vsp);
    vsp = 0;
}
y += vsp;