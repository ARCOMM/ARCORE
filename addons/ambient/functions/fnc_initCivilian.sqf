/*
 * Author: Jay
 *
 * Arguments:
 * _position - middle of spawn area
 * _radius - size of spawn area
 *
 * Return Value:
 * civilian unit
 *
 * Example:
 * [[0,0,0], 500] call arcore_ambient_fnc_initCivilian;
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_class", "_group", "_civilian", "_waypoint1", "_waypoint2", "_buildingSizeMin", "_waypointDistance", "_civilianClassBase", "_civilianClasses"];
params ["_position", "_radius"];

_buildingSizeMin = getNumber (getMissionConfig "CfgARCMF" >> "Ambient" >> "Civilians" >> "buildingSizeMin");
_waypointDistance = getNumber (getMissionConfig "CfgARCMF" >> "Ambient" >> "Civilians" >> "waypointDistance");
_civilianClassBase = getText (getMissionConfig "CfgARCMF" >> "Ambient" >> "Civilians" >> "classBase");
_civilianClasses =
    "inheritsFrom _x == (configFile >> 'CfgVehicles' >> '" + _civilianClassBase + "')"
    configClasses
    (configFile >> "CfgVehicles");

_buildingPos = [_position, _radius, _buildingSizeMin] call CFUNC(getRandomBuildingPos);
if (0 == _buildingPos select 0) exitWith { objNull };

_class = selectRandom _civilianClasses;

_group = createGroup civilian;
_group setSpeedMode "LIMITED";
_group setBehaviour "CARELESS";

_civilian = _group createUnit [
  configName _class,
  [0,0,0], [], 0, "NONE"
];
_civilian switchMove "";
_civilian enableSimulation false;
_civilian setSkill 0;
_civilian setAnimSpeedCoef 0.8 + random 0.2;
_civilian setSpeaker "NoVoice";
_civilian disableAI "AIMINGERROR";
_civilian disableAI "AUTOCOMBAT";
_civilian disableAI "AUTOTARGET";
_civilian disableAI "CHECKVISIBLE";
_civilian disableAI "COVER";
_civilian disableAI "FSM";
_civilian disableAI "SUPPRESSION";
_civilian disableAI "TARGET";

_civilian addEventHandler ["hit", { _this call FUNC(civilianCasuality) }];
_civilian addEventHandler ["killed", { _this call FUNC(civilianCasuality) }];
_civilian addEventHandler ["firednear", { _this call FUNC(civilianFirednear) }];

[_civilian, _buildingPos] call CBA_fnc_setPos;

_waypoint1 = [_buildingPos, _waypointDistance, _buildingSizeMin] call CFUNC(getRandomBuildingPos);
[_civilian, _waypoint1, 0, "MOVE"] call CBA_fnc_addWaypoint;
_waypoint2 = [_buildingPos, _waypointDistance, _buildingSizeMin] call CFUNC(getRandomBuildingPos);
[_civilian, _waypoint2, 0, "MOVE"] call CBA_fnc_addWaypoint;
[_civilian, _buildingPos, 0, "CYCLE"] call CBA_fnc_addWaypoint;

_civilian enableSimulation true;

_civilians = player getVariable ["ARCORE_ambient_civilians", []];
_civilians = _civilians + [_civilian];
player setVariable ["ARCORE_ambient_civilians", _civilians];

_civilian
