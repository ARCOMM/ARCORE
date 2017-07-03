/*
 * Author: Kingsley
 * Gets the unit marker class name
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call arcore_common_fnc_getUnitMarker;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_unit", objNull, [objNull]]];

if (isNull _unit) exitWith {""};

if (leader _unit == _unit) exitWith {QEGVAR(group,Leader)};
if (getText (configFile >> "CfgWeapons" >> secondaryWeapon _unit >> "UIPicture") == "\a3\weapons_f\data\ui\icon_at_ca.paa") exitWith {QEGVAR(group,AT)};
if (getText (configFile >> "CfgWeapons" >> primaryWeapon _unit >> "UIPicture") == "\a3\weapons_f\data\ui\icon_mg_ca.paa") exitWith {QEGVAR(group,MG)};
if (getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "attendant") == 1) exitWith {QEGVAR(group,Medic)};
if (getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "engineer") == 1) exitWith {QEGVAR(group,Engineer)};

QEGVAR(group,Rifleman)
