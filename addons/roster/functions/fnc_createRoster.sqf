/*
 * Author: Kingsley
 * Creates the platoon roster for the given side
 *
 * Arguments:
 * 0: Side <SIDE>
 *
 * Return Value:
 * None
 *
 * Example:
 * [west] call arcore_roster_fnc_createRoster;
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_side", sideUnknown, [sideUnknown]]];

if (_side == sideUnknown) exitWith {};

//--- How this works
// Makes an array of letter groups containing the a common group initial (first letter) and an array of groups
// Sorts the letter groups by alphabet ascending
// For each letter group is will sort the groups by their element number and then the leaders rank ID
// Lastly it appends it to the output

private _elementNumber = {
    params [["_callsign", "", [""]]];

    if (_callsign == "") exitWith {};

    private _letters = _callsign splitString "";
    private _numbers = [];

    {if (_x in ["0","1","2","3","4","5","6","7","8","9"]) exitWith {_numbers pushBack _x}} forEach _letters;

    if (_numbers isEqualTo []) then {_numbers = [-1]};

    diag_log format ["Input: %1, Output: %2", _callsign, (_numbers joinString "")];
    (_numbers joinString "")
};

private _output = "";
private _groups = allGroups select {side _x == _side && {count units _x > 0}};
private _letterGroups = [];

{
    private _group = _x;
    private _text = _group getVariable [QGVAR(ElementName), _group getVariable [QEGVAR(group,text), groupId _group]];
    private _initial = _text select [0,1];
    private _index = -1;

    {
        _x params ["_letter", "_lGroups"];

        if (_initial == _letter) exitWith {
            _index = _forEachIndex;
            _lGroups pushBack _group;
            _letterGroups set [_forEachIndex, [_letter, _lGroups]];
        };
    } forEach _letterGroups;

    if (_index == -1) then {
        _letterGroups pushBack [_initial, [_group]];
    };
} forEach _groups;

_letterGroups sort true;

{
    _x params ["_letter", "_groups"];

    _sorted = _groups apply {[
        [_x getVariable [QEGVAR(group,text), groupId _x]] call _elementNumber,
        rankId leader _x,
        _x
    ]};

    _sorted sort false;
    reverse _sorted;

    private _elementName = (_groups param [0, grpNull]) getVariable [QGVAR(ElementName), ""];
    private _elementText = [format ["<font size='14' face='PuristaBold' color='#FFFFFF'>%1</font><br/>", toUpper _elementName], ""] select (_elementName == "");

    _output = format [
        "%1<br/>%2",
        _output,
        _elementText
    ];

    {
        _x params ["_elNumber", "_rankID", "_group"];

        private _callsign = _group getVariable [QEGVAR(group,text), groupId _group];
        private _color = _group getVariable [QEGVAR(group,color), format ["Color%1", side _group]];
        private _colorHex = [_color] call CFUNC(markerColorToHex);

        _output = format [
            "%1<font size='13' face='PuristaSemibold' color='#FFFFFF'>%2</font>  ",
            _output,
            _callsign
        ];

        private _unitsStr = "";
        private _units = units _group;
        _units = _units apply {[rankId _x, _x]};
        _units sort false;
        _units = _units apply {_x select 1};

        {
            private _isMedic = typeOf _x in ["B_medic_F", "O_medic_F", "I_medic_F"];
            private _medicIcon = [
                "",
                "<font size='14' color='#FFFFFF' face='RobotoCondensed' image='\A3\ui_f\data\map\vehicleicons\iconManMedic_ca.paa' width='16' height='16'></font>"
            ] select _isMedic;

            _unitsStr = format [
                "%1<font size='14' color='%2' face='RobotoCondensed'>%3%5</font>%4",
                _unitsStr,
                _colorHex,
                name _x,
                [",  ","<br/>"] select ((_forEachIndex + 1) == count _units),
                _medicIcon
            ];
        } forEach _units;

        _output = format ["%1%2", _output, _unitsStr];
    } forEach _sorted;
} forEach _letterGroups;

player createDiaryRecord ["diary", ["Platoon Roster", _output]];
