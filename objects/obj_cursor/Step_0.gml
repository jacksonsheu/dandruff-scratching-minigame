// Follow the mouse every step so the sprite acts as the cursor
x = mouse_x
y = mouse_y

if mouse_check_button_pressed(mb_left){	// if we click left mouse
	scratching = true	// scratching "state" is on
	image_index = 1 //	change the sprite frame to closed hand
}


if mouse_check_button_released(mb_left){	// if we release left mouse button
	scratching = false	// scratching "state" is off
	image_index = 0		// return to open hand frame of sprite
}