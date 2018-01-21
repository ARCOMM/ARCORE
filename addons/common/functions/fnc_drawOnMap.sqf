/*
 * Author: Kingsley
 * Draws the given object's bounding box on the map.
 *
 * Arguments:
 * 0: Object
 *
 * Return Value:
 * None
 *
 * Example:
 * [object] call arcore_common_fnc_drawOnMap;
 *
 * Public: Yes
 */

#include "script_component.hpp"

if (!isServer) exitWith {};

params [["_object", objNull, [objNull]]];

private _box = boundingBoxReal _object;
private _pos = getPos _object;
private _name = format ["%1_drawOnMap_%2", QUOTE(ADDON), str _pos];
private _marker = createMarker [_name, _pos];

_marker setMarkerPos _pos;
_marker setMarkerBrush "Solid";
_marker setMarkerShape "RECTANGLE";
_marker setMarkerColor "ColorBlack";
_marker setMarkerAlpha 0.5;
_marker setMarkerDir (getDir _object);

_marker setMarkerSize [
    (_object modelToWorldVisual (_box select 0)) distance (_object modelToWorldVisual [(_box select 1 select 0), (_box select 0 select 0), (_box select 0 select 0)]),
    (_object modelToWorldVisual (_box select 0)) distance (_object modelToWorldVisual [(_box select 0 select 0), (_box select 0 select 0), (_box select 1 select 2)])
];

nil
