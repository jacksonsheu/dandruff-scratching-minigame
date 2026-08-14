// Remember last frame's mouse position so the Step event can measure how fast the player is scrubbing
prev_mouse_x = mouse_x;
prev_mouse_y = mouse_y;

scratch_sound_playing = false	// guard so the looping scratch sound is only started once