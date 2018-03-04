/*
 * Author: Jay
 *
 * Arguments:
 * see "firednear" event handler
 *
 * Return Value:
 * false
 *
 * Example:
 * _civilian addEventHandler ["firednear", { _this call FUNC(civilianFirednear) }];
 *
 * Public: Yes
 */

params ["_unit", "_vehicle", "_distance", "_weapon", "_muzzle", "_mode", "_ammo", "_gunner"];
private ["_isScared", "_building", "_waypoint"];

_isScared = _unit getVariable ["ARCORE_ambient_isScared", false];
if (_isScared) exitWith {};

_building = _unit call CBA_fnc_getNearestBuilding;

while {count waypoints group _unit > 0} do
{
    deleteWaypoint ((waypoints group _unit) select 0);
};

_waypoint = (_building select 0) buildingPos (random (_building select 1));
[
    _unit, _waypoint, 0,
    "MOVE", "CARELESS", "BLUE", "FULL", "COLUMN",
    "this playMove 'AmovPercMstpSnonWnonDnon_Scared'; this disableAI 'ANIM';"
]
call CBA_fnc_addWaypoint;

_unit setVariable ["ARCORE_ambient_isScared", true];

false
