/*
 * Author: Kingsley
 * Handles the debug tags per frame handler.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call arcore_ai_fnc_handleDebugTags;
 *
 * Public: No
 */

#include "script_component.hpp"

[{
    {
        private _text = _x getVariable [QGVAR(debugText), ""];

        if (_text != "") then {
            drawIcon3D [
                "",
                [0,0,0,1],
                getPosVisual _x,
                0,
                0,
                0,
                _text
            ];
        };

        false
    } count (allUnits select {
        !isPlayer _x && local _x
    });
}, 0] call CBA_fnc_addPerFrameHandler;
