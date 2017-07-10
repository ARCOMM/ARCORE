/*
 * Author: Kingsley
 * Handles the loadout attribute dialog.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call arcore_loadout_fnc_handleAttributeLoadout;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_data"];

private _faction = [_data, 'Main_Faction_Control'] call AFUNC(getControlValue);
private _role = [_data, 'Main_Role_Control'] call AFUNC(getControlValue);

[player, format ["%1:%2", (_faction select 1), _role]] call FUNC(assignLoadout);
