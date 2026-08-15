// Keeps the whole game visible, centred and un-cropped inside a browser window.
//
// The room (1000 x 1100) is taller than most browser viewports, so at 1:1 the
// canvas gets cut off. This object resizes the canvas to the largest size that
// still fits the browser while preserving the aspect ratio (letterboxing), and
// keeps the camera framing the entire room so nothing is ever clipped.
//
// It pairs with the HTML5 "Keep aspect ratio" + "Centre game" options: those
// guarantee the canvas stays centred and fully visible even before this object's
// first successful measurement, and because the size picked here always matches
// the room's aspect ratio the two never fight each other.

// Persistent, so make sure a second room entry can't leave two of them running
if (instance_number(obj_browser_scaler) > 1)
{
	instance_destroy();
	exit;
}

base_width  = room_width;	// design resolution = the room itself
base_height = room_height;

desktop_fill = 0.9;			// on desktop targets, leave room for the taskbar/title bar

last_avail_width  = -1;		// last area we scaled to, so we only rescale on change
last_avail_height = -1;

target_width  = base_width;	// canvas size we want the application surface to match
target_height = base_height;

// One camera that always frames the whole room. Created explicitly so this works
// even if the room was saved with views disabled.
view_enabled    = true;
view_visible[0] = true;
cam = camera_create_view(0, 0, base_width, base_height);
view_camera[0] = cam;

/// @return {array} [width, height] of the space the game may occupy
get_available_size = function()
{
	if (os_browser == browser_not_a_browser)
	{
		return [
			floor(display_get_width()  * desktop_fill),
			floor(display_get_height() * desktop_fill)
		];
	}

	return [browser_width, browser_height];
};

/// Keeps the render target the same size as the canvas, so the room is rescaled
/// instead of cropped. The application surface may not exist yet on the very
/// first frames, which is why this is retried every step.
sync_application_surface = function()
{
	if (!surface_exists(application_surface)) return false;

	if (surface_get_width(application_surface)  != target_width
	||  surface_get_height(application_surface) != target_height)
	{
		surface_resize(application_surface, target_width, target_height);
	}

	return true;
};

/// @param	{real}	_avail_width	Usable width in pixels
/// @param	{real}	_avail_height	Usable height in pixels
/// Resizes the canvas to the biggest aspect-correct fit inside the given area.
apply_scale = function(_avail_width, _avail_height)
{
	// min() of the two ratios = "contain": always fits, never crops
	var _scale = min(_avail_width / base_width, _avail_height / base_height);

	target_width  = max(1, floor(base_width  * _scale));
	target_height = max(1, floor(base_height * _scale));

	window_set_size(target_width, target_height);
	if (os_browser == browser_not_a_browser) window_center();

	sync_application_surface();

	// The viewport fills the canvas; the camera still shows the whole room,
	// so everything is scaled rather than cut off.
	view_xport[0] = 0;
	view_yport[0] = 0;
	view_wport[0] = target_width;
	view_hport[0] = target_height;

	camera_set_view_pos(cam, 0, 0);
	camera_set_view_size(cam, base_width, base_height);

	// GUI layer keeps room coordinates no matter how big the canvas is
	display_set_gui_size(base_width, base_height);
};

/// @return {bool} true if the canvas was rescaled by this call
refresh = function()
{
	var _avail = get_available_size();

	// browser_width/height report 0 for the first frame or two while the page lays out
	if (_avail[0] <= 0 || _avail[1] <= 0) return false;
	if (_avail[0] == last_avail_width && _avail[1] == last_avail_height) return false;

	apply_scale(_avail[0], _avail[1]);

	last_avail_width  = _avail[0];
	last_avail_height = _avail[1];
	return true;
};

refresh();
