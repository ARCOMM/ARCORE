/*
 * Author: alganthe
 * Handles placing the AI into houses
 *
 * Arguments:
 * 0: The building(s) nearest this position are used <POSITION/OBJECT>
 * 1: Limit the building search to those type of building <ARRAY>
 * 2: Units that will be garrisoned <ARRAY/OBJECT/GROUP>
 * 3: Radius to fill building(s) -1 for nearest only <SCALAR> default: -1
 * 4: 0: even filling, 1: building by building, 2: random filling <SCALAR> default: 0
 * 5: True to fill building(s) from top to bottom <BOOL> default: false
 *
 * Return Value:
 * Array of units not garrisoned
 *
 * Example:
 * [this, nil, this, 200, 0, false] call arcore_ai_fnc_garrison;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_startingPos", [0,0,0], [[], objNull]],
    ["_buildingTypes", ["Building"]],
    ["_unitsArray", [], [[], grpNull, objNull]],
    ["_fillingRadius", -1],
    ["_fillingType", 0],
    ["_topDownFilling", false]
];

if (_startingPos isEqualType objNull) then {
    _startingPos = getPosATL _startingPos;
};

if (_startingPos isEqualTo [0,0,0]) exitWith {
    player sideChat str "AIOccupyBuilding Error : Invalid position given.";
    diag_log "AIOccupyBuilding Error : Invalid position given.";
};

if (_unitsArray isEqualType objNull) then {
    _unitsArray = units (group _unitsArray);
};

if (_unitsArray isEqualType grpNull) then {
    _unitsArray = units _unitsArray;
};

if (count _unitsArray == 0 || {isNull (_unitsArray select 0)}) exitWith {
    player sideChat str "AIOccupyBuilding Error : No units provided.";
    diag_log "AIOccupyBuilding Error : No units provided.";
};

private _buildings = [];

if (_fillingRadius == -1) then {
    _buildings = nearestObjects [_startingPos, _buildingTypes, 50];
} else {
    _buildings = nearestObjects [_startingPos, _buildingTypes, _fillingRadius];
    _buildings = _buildings call ARC_fnc_arrayShuffle;
};

if (count _buildings == 0) exitWith {
    player sideChat str "AIOccupyBuilding Error : No building found.";
    diag_log "AIOccupyBuilding Error : No building found.";
};

private _buildingsIndexes = [];

if (_topDownFilling) then {
    {
        private _buildingPos = _x buildingPos -1;

        {
            reverse _x;
        } foreach _buildingPos;

        _buildingPos sort false;

        {
            reverse _x;
        } foreach _buildingPos;

        _buildingsIndexes pushback _buildingPos;
    } foreach _buildings;
} else {
    {
        _buildingsIndexes pushback (_x buildingPos -1);
    } foreach _buildings;
};

// Remove buildings without pos
{
    _buildingsIndexes deleteAt (_buildingsIndexes find _x);
} foreach (_buildingsIndexes select {count _x == 0});

private _cnt = 0;
{_cnt = _cnt + count _x} foreach _buildingsIndexes;
private _leftOverAICount = (count _unitsArray) - _cnt;
if (_leftOverAICount > 0) then {
    diag_log "AIOccupyBuilding Warning: Not enough spots to place all units";
};

switch (_fillingType) do {
    case 0: {
        while {count _unitsArray > 0} do {
            scopeName "derp";
            if (count _buildingsIndexes == 0) exitWith {breakOut "derp"};

            private _building = _buildingsIndexes select 0;

            // Remove building if all pos are used
            if (_building isEqualTo []) then {
                _buildingsIndexes deleteAt 0;
                breakTo "derp";
            };

            private _pos = _building select 0;

            if (count (_pos nearEntities ["CAManBase", 1]) > 0) then {
                _buildingsIndexes set [0,  _building - [_pos]];
                breakTo "derp";
            } else {
                private _unit = _unitsArray select 0;
                _unit disableAI "PATH";
                _unit setPos _pos;
                _unit setUnitPos (selectRandom ["MIDDLE","UP"]);
                _unitsArray deleteAt (_unitsArray find _unit);
                _building deleteAt 0;
                _buildingsIndexes deleteAt 0;
                _buildingsIndexes pushbackUnique _building;
            };
        };
    };

    case 1: {
        while {count _unitsArray > 0} do {
            scopeName "derp";
            if (count _buildingsIndexes == 0) exitWith {breakOut "derp"};

            private _building = _buildingsIndexes select 0;

            // Remove building if all pos are used
            if (_building isEqualTo []) then {
                _buildingsIndexes deleteAt 0;
                breakTo "derp";
            };

            private _pos = _building select 0;

            // Remove building if all pos are used
            if (count (_pos nearEntities ["CAManBase", 1]) > 0) then {
                _buildingsIndexes set [0, _building - [_pos]];
                breakTo "derp";
            } else {
                private _unit = _unitsArray select 0;
                _unit disableAI "PATH";
                _unit setPos _pos;
                _unit setUnitPos (selectRandom ["MIDDLE","UP"]);
                _unitsArray deleteAt (_unitsArray find _unit);
                _buildingsIndexes set [0,  _building - [_pos]];
            };
        };
    };

    case 2: {
        while {count _unitsArray > 0} do {
            scopeName "derp";
            if (count _buildingsIndexes == 0) exitWith {breakOut "derp"};

            private _building = selectRandom _buildingsIndexes;

            // Remove building if all pos are used
            if (_building isEqualTo []) then {
                _buildingsIndexes deleteAt (_buildingsIndexes find _building);
                breakTo "derp";
            };

            private _pos = selectRandom _building;

            // Remove pos if unit nearby
            if (count (_pos nearEntities ["CAManBase", 1]) > 0) then {
                _buildingsIndexes set [(_buildingsIndexes find _building), _building - [_pos]];
                breakTo "derp";
            } else {
                private _unit = _unitsArray select 0;
                _unit disableAI "PATH";
                _unit setPos _pos;
                _unit setUnitPos (selectRandom ["MIDDLE","UP"]);
                _unitsArray deleteAt (_unitsArray find _unit);
                _buildingsIndexes set [(_buildingsIndexes find _building),  _building - [_pos]];
            };
        };
    };
};

_unitsArray
