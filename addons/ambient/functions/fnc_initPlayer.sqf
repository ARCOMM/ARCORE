/*
 * Author: Jay
 *
 * Arguments:
 * none
 *
 * Return Value:
 * false
 *
 * Example:
 * [] call arcore_ambient_fnc_initPlayer;
 *
 * Public: Yes
 */

#include "script_component.hpp"

[] call FUNC(hideMarkers);
[] spawn FUNC(preloadCivilians);

[
    {
        [] call FUNC(despawnCivilians);
        [] call FUNC(spawnCivilians);
    }, 5
]
call CBA_fnc_addPerFrameHandler;

false
