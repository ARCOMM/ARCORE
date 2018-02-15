/*
 * Author: Kingsley
 * Handles the placing of a waypoint in Zeus.
 *
 * Arguments:
 * 0: Zeus module <OBJECT>
 * 1: Group <GROUP>
 * 2: Waypoint <WAYPOINT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call arcore_ai_fnc_handleWaypointPlaced;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_curator", "_group", "_waypoint"];

private _waypointArray = waypoints _group select _waypoint;
private _destination = waypointPosition _waypointArray;

[QEGVAR(common,execute), [{
    params ["_group", "_destination"];

    {
        private _unit = _x;

        _unit setUnitPos "UP";
        _unit setSpeedMode "FULL";
        _unit setBehaviour "CARELESS";
        _unit setCombatMode "BLUE";

        _unit disableAI "TARGET";
        _unit disableAI "AUTOTARGET";

        _unit allowFleeing 0;

        _unit doWatch objNull;
        _unit doTarget objNull;
        _unit commandWatch objNull;
        _unit commandTarget objNull;

        _unit setDestination [_destination, "LEADER PLANNED", true];

        private _diff = (getPos _unit) vectorDiff (getPos leader _unit);
        private _formationPos = _diff vectorAdd _destination;

        _unit doFollow _unit;
        _unit doMove _formationPos;

        private _durationEstimate = (_unit distance _formationPos) / 3.5;

        [{
            params ["_unit", "_pos"];
            isNull _unit ||
            {!alive _unit} ||
            {(_unit distance _pos) < 1}
        }, {
            params ["_unit", "_pos"];

            [QEGVAR(common,execute), [{
                params ["_unit", "_pos"];

                _unit setUnitPos "UP";
                _unit setSpeedMode "FULL";
                _unit setBehaviour "AWARE";
                _unit setCombatMode "RED";

                _unit enableAI "TARGET";
                _unit enableAI "AUTOTARGET";

                _unit doFollow leader _unit;
            }, _this], _unit] call CBA_fnc_targetEvent;
        }, [_unit, _formationPos], _durationEstimate] call CBA_fnc_waitUntilAndExecute;
    } forEach units _group;
}, [_group, _destination]], _group] call CBA_fnc_targetEvent;
