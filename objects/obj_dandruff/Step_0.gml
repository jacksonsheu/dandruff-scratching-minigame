// Simple hand-rolled gravity: move by current velocity, then accelerate downward.
x += xspd
y += yspd

yspd += grav_amt

image_angle += spin_spd

// Floor check: park the flake just above the bottom of the room and freeze it.
// There is no bounce or drag.
if (y >= room_height - 5)
{
    y = room_height - 5;
	xspd = 0;
    yspd = 0;
	spin_spd = 0;
}