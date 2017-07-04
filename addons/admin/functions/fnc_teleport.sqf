/*
 * Author: Kingsley
 * Teleports the selected units to the chosen location using the chosen method
 *
 * Arguments:
 * Attributes controls <ARRAY>
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

params ["_data"];

private _unitSelection = [_data, 'Basic_PlayerList_Control'] call AFUNC(getControlValue);
private _insertionMethod = ([_data, 'Basic_InsertionMethod_Control'] call AFUNC(getControlValue)) param [1, "teleport"];
private _paraHeight = [_data, 'Basic_ParaHeight_Control'] call AFUNC(getControlValue);
private _paraRadius = [_data, 'Basic_ParaRadius_Control'] call AFUNC(getControlValue);
private _destination = [_data, 'Basic_Destination_Control'] call AFUNC(getControlValue);

if (_unitSelection isEqualTo []) exitWith {};

private _selectionObjects = allPlayers select {(getPlayerUID _x) in _unitSelection};
_selectionObjects = _selectionObjects arrayIntersect _selectionObjects;

switch (toLower _insertionMethod) do {
    case "teleport": {
        {_x setPosATL ([_destination, 10] call CBA_fnc_randPos)} forEach _selectionObjects;
    };

    case "paradrop": {
        [_selectionObjects, _destination, _paraHeight, _paraRadius] remoteExecCall [QCFUNC(paraDrop), 2];
    };
};
