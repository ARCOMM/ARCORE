/*
 * Author: Kingsley
 * Sends in the selected units as reinforcements using the chosen method
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

private _selectionObjects = allUnits select {(getPlayerUID _x) in _unitSelection};
_selectionObjects = _selectionObjects arrayIntersect _selectionObjects;

{
    [{
        params ["_unit", "_args"];
        _args params ["_insertionMethod", "_destination", "_paraHeight", "_paraRadius"];

        switch (toLower _insertionMethod) do {
            case "teleport": {
                _unit setPosATL ([_destination, 10] call CBA_fnc_randPos);
            };

            case "paradrop": {
                [[_unit], _destination, _paraHeight, _paraRadius] remoteExecCall [QCFUNC(paraDrop), 2];
            };
        };
    }, [_insertionMethod, _destination, _paraHeight, _paraRadius]] remoteExecCall [QEFUNC(spectator,exit), _x];
} forEach _selectionObjects;
