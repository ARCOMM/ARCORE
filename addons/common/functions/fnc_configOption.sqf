/*
 * Author: Kingsley
 * Gets the given config option from the ARCMF mission config file.
 *
 * Arguments:
 * 0: Option key <STRING>
 * 1: Default value if not set <ANY>
 *
 * Return Value:
 * Any
 *
 * Example:
 * ["markers.blufor.enableGroupMarkers", false] call arcore_common_fnc_configOption;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_key", "", [""]],
    ["_default", ""]
];

if (_key == "") exitWith {};

private _config = (missionConfigFile >> "CfgARCMF");

private _parts = _key splitString ".";
{_config = (_config >> _x)} forEach _parts;

if (isNull _config) exitWith {_default};

private _data = _config call BIS_fnc_getCfgData;

if (_data isEqualType "" && {_data == "true"}) exitWith {true};
if (_data isEqualType "" && {_data == "false"}) exitWith {false};

_data
