// Per-flake randomisation so no two particles look or move alike.
image_xscale = random_range(1, 0.5)
image_yscale = random_range(1, 0.5)

spin_spd = random_range(20, -20)	// degrees added to image_angle each step

// Starting velocity: scattered sideways, with a small upward "pop" off the scalp
xspd = random_range(-3,3)
yspd = random_range(-1, 0)

grav_amt = 0.05		// downward acceleration added to yspd every step

settled = false