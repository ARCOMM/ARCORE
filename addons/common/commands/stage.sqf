/*
 * Author: Kingsley
 * Stages the caller's side at their chosen position.
 *
 * Arguments:
 * Console arguments.
 *
 * Return Value:
 * None
 *
 * Example:
 * N/A
 *
 * Public: No
 */

#include "script_component.hpp"

// Exit if briefing stage has ended
if (!isNil QEGVAR(briefing,briefingEnded) && {EGVAR(briefing,briefingEnded)}) exitWith {
    systemChat "Cannot stage outside of briefing";
};

if !(leader ace_player isEqualTo ace_player) exitWith {
    systemChat "You need to be the group leader to stage";
};

{
    _x params ["_logic", "_width", "_height"];

    private _marker = createMarkerLocal [format ["%1_%2", QGVAR(safeZone), (_logic call BIS_fnc_netId)], _logic];
    _marker setMarkerShapeLocal "ELLIPSE";
    _marker setMarkerBrushLocal "Border";
    _marker setMarkerColorLocal "ColorBlue";
    _marker setMarkerSizeLocal [_width, _height];

    _logic setVariable [QGVAR(safeZoneMarker), _marker, true];
} forEach GVAR(adversarialSafeZones);

openMap true;

GVAR(stageMapClickHandler) = addMissionEventHandler ["MapSingleClick", {
	params ["_units", "_pos", "_alt", "_shift"];

    private _outside = true;

    {
        if (_pos inArea _x) then {
            _outside = false;
        };
    } forEach GVAR(adversarialSafeZones);

    if (!_outside) exitWith {
        systemChat "You cannot stage inside the safe zone";
    };

    {
        vehicle _x setPos _pos;
    } forEach units group ace_player;

    {
        _x params ["_logic"];
        private _marker = _logic getVariable [QGVAR(safeZoneMarker), ""];
        deleteMarkerLocal _marker;
    } forEach GVAR(adversarialSafeZones);

    openMap false;

    removeMissionEventHandler ["MapSingleClick", GVAR(stageMapClickHandler)];
}];
