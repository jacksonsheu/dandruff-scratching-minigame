/// @function	chance(n)
/// @param	{real}	n	Odds denominator: the higher n is, the rarer the hit.
/// @return	{real}	1 on a 1-in-n success, 0 otherwise.
/// Used to throttle per-step events (e.g. particle spawning) so they don't fire every frame.
function chance(n)
{
    if (irandom(n - 1) == 0)
        return 1;
    else
        return 0;
}