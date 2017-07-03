/*
 * Author: Kingsley
 * Creates the briefing for the given side
 *
 * Arguments:
 * 0: Side <SIDE>
 *
 * Return Value:
 * None
 *
 * Example:
 * [west] call arcore_briefing_fnc_createBriefing;
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_side", sideUnknown, [sideUnknown]]];

private _faction = [_side] call CFUNC(getFaction);
private _sections = configProperties [(missionConfigFile >> "CfgARCMF" >> "Briefing" >> _faction)];

private _output = "";

{
    private _header = toUpper ([configName _x] call CFUNC(camelToTitle));
    private _lines = getArray _x;

    if !(_lines isEqualTo []) then {
        _output = format ["%1<font size='15' face='PuristaBold'>%2</font><br/>", _output, _header];
    };

    {
        private _line = _x;

        if (count _line > 0) then {
            private _firstChar = _line select [0, 1];
            private _lineBreak = ["", "<br/><br/>"] select (_forEachIndex != (count _lines - 1));

            if (_firstChar == '-') then {
                _lineBreak = '<br/>';
            };

            if (_forEachIndex == (count _lines - 1)) then {
                _lineBreak = '<br/><br/>';
            };

            _output = format ["%1<font size='13' face='RobotoCondensed'>%2</font>%3", _output, _line, _lineBreak];
        };
    } forEach _lines;
} forEach _sections;

if (count _output > 0) then {
    player createDiaryRecord ["diary", ["Briefing", _output]];
};
