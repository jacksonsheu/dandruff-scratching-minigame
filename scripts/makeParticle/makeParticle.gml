/// @function	makeParticle(_x, _y, _xspread, _yspread, _amt)
/// @param	{real}	_x			Centre x of the spawn burst.
/// @param	{real}	_y			Centre y of the spawn burst.
/// @param	{real}	_xspread	Max random horizontal offset from centre (+/-).
/// @param	{real}	_yspread	Max random vertical offset from centre (+/-).
/// @param	{real}	_amt		How many dandruff instances to create.
/// Spawns a scatter of obj_dandruff; each instance handles its own falling motion.
function makeParticle(_x, _y,_xspread, _yspread, _amt){
	
	for( var i=0; i<_amt; i+=1) {
		// depth 0 puts flakes above obj_person (depth 10) but below the cursor (depth -2000)
		instance_create_depth(
			_x + random_range(-_xspread, _xspread),
			_y + random_range(-_yspread, _yspread), 
			0, 
			obj_dandruff)	
	}
	
}