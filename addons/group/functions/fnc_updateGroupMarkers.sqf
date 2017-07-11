/*
 * Author: Kingsley
 * Updates the group markers
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call arcore_group_fnc_updateGroupMarkers;
 *
 * Public: No
 */

#include "script_component.hpp"

{deleteMarkerLocal _x;false} count GVAR(groupMarkers);

GVAR(groupMarkers) = [];

private _playerSide = playerSide;
private _markerIndex = 0;
private _sides = [west, east, resistance, civilian];
private _groupsToDrawMarkers = allGroups select {
    private _sideFlags = [
        _x getVariable [QGVAR(ShowBLUFOR), side _x == west],
        _x getVariable [QGVAR(ShowOPFOR), side _x == east],
        _x getVariable [QGVAR(ShowINDFOR), side _x == resistance],
        _x getVariable [QGVAR(ShowCIV), side _x == civilian]
    ];

    private _index = _sides find _playerSide;

    ([false, _sideFlags select _index] select (_index > -1)) &&
    {count units _x > 0} &&
    {!(_x getVariable [QEGVAR(spectator,virtual), false])}
};

{
    private _group = _x;
    private _enabled = _group getVariable [QGVAR(enabled), false];

    if (_enabled) then {
        private _pos = getPos leader _group;
        private _delay = _group getVariable [QGVAR(delay), DEFAULT_DELAY];
        private _lastUpdated = _group getVariable [QGVAR(lastUpdated), 0];
        private _accuracy = _group getVariable [QGVAR(accuracy), 0];
        private _text = _group getVariable [QGVAR(text), groupId _group];
        private _color = _group getVariable [QGVAR(color), format ["Color%1", side _x]];
        private _markerType = [_x] call CFUNC(getMarkerType);
        private _adjustedPos = _group getVariable [QGVAR(previousPos), _pos];

        if (_delay < 2) then {
            _delay = 2;
        };

        _group setGroupIdGlobal [_text, "GroupColor0"];

        if ((time - _lastUpdated) >= _delay || !GVAR(hasRun)) then {
            _adjustedPos = if (_accuracy > 0) then {[leader _group, _accuracy] call CBA_fnc_randPos} else {_pos};
            _group setVariable [QGVAR(lastUpdated), time, true];
            _group setVariable [QGVAR(previousPos), _adjustedPos, true];
        };

        private _marker = createMarkerLocal [
            format ["%1_%2", QGVAR(marker), _markerIndex],
            _adjustedPos
        ];

        _marker setMarkerShapeLocal "ICON";
        _marker setMarkerTypeLocal _markerType;
        _marker setMarkerColorLocal _color;
        _marker setMarkerTextLocal _text;
        _marker setMarkerSizeLocal [0.88, 0.88];

        private _code = _group getVariable [QGVAR(code), ""];

        if (_code != "") then {
            _marker call compile _code;
        };

        GVAR(groupMarkers) pushBack _marker;
        INC(_markerIndex);
    };

    false
} count _groupsToDrawMarkers;
