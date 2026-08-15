// camera_create_view() allocates a camera, so release it with the instance.
// A duplicate instance destroys itself before reaching that point, hence the guard.
if (variable_instance_exists(id, "cam"))
{
	if (view_camera[0] == cam) view_camera[0] = -1;
	camera_destroy(cam);
}
