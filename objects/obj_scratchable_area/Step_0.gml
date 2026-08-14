
// This object is the game's core driver: invisible hitboxes (visible = false) laid over the
// scalp that detect scratching, drive obj_person's animation, and emit dandruff.

// How far the mouse travelled since last step - used as the "scrubbing speed"
var mouse_speed = point_distance(mouse_x, mouse_y, prev_mouse_x, prev_mouse_y);

//if the player is holding left mouse button and moving mouse fast enough
if mouse_check_button(mb_left) 
&& position_meeting(mouse_x, mouse_y, obj_scratchable_area) {
	obj_person.scratching = true
	
	// Start the looping SFX only on the first frame of a scratch, not every step
	if (!scratch_sound_playing){
        audio_play_sound(snd_scratch, 1, true); // true = loop
        scratch_sound_playing = true;
    }
	
	// Only fast scrubbing sheds flakes, and chance(6) thins it to ~1 burst every 6 steps
	if mouse_speed > 20 and chance(6){
		makeParticle(mouse_x, mouse_y, 5, 5, 1)
	}
} else {
	// Not scratching: reset the animation and kill the looping sound
	obj_person.scratching = false
	if (scratch_sound_playing) {
        audio_stop_sound(snd_scratch);
        scratch_sound_playing = false;
    }
}

// Store this frame's position for the next step's speed calculation
prev_mouse_x = mouse_x;
prev_mouse_y = mouse_y;