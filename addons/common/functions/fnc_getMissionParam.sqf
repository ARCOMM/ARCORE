/*
 * Author: Kingsley
 * Gets the given mission parameter value
 *
 * Arguments:
 * 0: Param config name <STRING>
 *
 * Return Value:
 * Param value <NUMBER>
 *
 * Example:
 * ["BriefingTimer"] call arcore_common_fnc_getMissionParam;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_param", "", [""]]];

if (_param == "") exitWith {};

private _index = -1;

{
    if (configName _x == _param) then {
        _index = _forEachIndex;
    };
} forEach ("true" configClasses (missionConfigFile >> "Params"));

(paramsArray param [_index, ""])
