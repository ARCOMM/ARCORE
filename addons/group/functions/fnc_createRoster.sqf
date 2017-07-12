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
 * [west] call arcore_group_fnc_createRoster;
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_side", sideUnknown, [sideUnknown]]];

if (_side == sideUnknown) exitWith {};

private _elementNumber = {
    params [["_callsign", "", [""]]];

    if (_callsign == "") exitWith {};

    private _letters = _callsign splitString "";
    private _numbers = [];

    {if (_x in ["0","1","2","3","4","5","6","7","8","9"]) exitWith {_numbers pushBack _x}} forEach _letters;

    if (_numbers isEqualTo []) then {_numbers = [-1]};

    (_numbers joinString "")
};

private _output = [];
private _elements = [];
private _groups = allGroups select {
    side _x == _side &&
    {count units _x > 0} &&
    {(_x getVariable [QGVAR(rosterEnabled), false])} &&
    {!(_x getVariable [QEGVAR(spectator,virtual), false])}
};

{
    private _group = _x;
    private _text = _group getVariable [QGVAR(ElementName), ""];
    private _order = _group getVariable [QGVAR(RosterOrder), 100];
    private _index = -1;

    {
        _x params ["_order", "_name", "_groups"];

        if (_text == _name) exitWith {
            _index = _forEachIndex;
            _groups pushBack _group;
            _elements set [_forEachIndex, [_order, _name, _groups]];
        };
    } forEach _elements;

    if (_index == -1) then {
        _elements pushBack [_order, _text, [_group]];
    };
} forEach _groups;

_elements sort true;

{
    _x params ["_order", "_name", "_groups"];

    _sorted = _groups apply {[
        [_x getVariable [QGVAR(text), groupId _x]] call _elementNumber,
        rankId leader _x,
        _x
    ]};

    _sorted sort false;
    reverse _sorted;

    private _elementText = format ["<font size='14' face='PuristaBold' color='#FFFFFF'>%1</font><br/>", toUpper _name];

    _output pushBack format [
        "<br/>%1",
        _elementText
    ];

    {
        _x params ["_elNumber", "_rankID", "_group"];

        private _callsign = _group getVariable [QGVAR(text), groupId _group];
        private _color = _group getVariable [QGVAR(color), format ["Color%1", side _group]];
        private _colorHex = [_color] call CFUNC(markerColorToHex);

        _output pushBack format [
            "<font size='13' face='PuristaSemibold' color='#FFFFFF'>%1</font>  ",
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

        _output pushBack format ["%1", _unitsStr];
    } forEach _sorted;
} forEach _elements;

player createDiaryRecord ["diary", ["Platoon Roster", _output joinString ""]];
