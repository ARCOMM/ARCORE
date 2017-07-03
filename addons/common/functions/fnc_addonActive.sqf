/*
 * Author: Kingsley
 * Checks whether the addon is activated in the mission config
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Addon enabled <BOOL>
 *
 * Example:
 * [] call arcore_common_fnc_addonActive;
 *
 * Public: Yes
 */

#include "script_component.hpp"

private _config = (missionConfigFile >> "Header" >> "ARCMF");

(!isNull _config && {getNumber _config == 1})
