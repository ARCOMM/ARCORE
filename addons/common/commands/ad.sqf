/*
 * Author: Kingsley
 * Sets up an adversarial scenario.
 *
 * Arguments:
 * Console arguments.
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

// Exit if briefing stage has ended
if (!isNil QEGVAR(briefing,briefingEnded) && {EGVAR(briefing,briefingEnded)}) exitWith {
    systemChat "Cannot setup attack/defend outside of briefing";
};

EXIT_IF_NOT_ADMIN;

params ["_arg"];

private _parts = _arg splitString " ";
private _attackers = _parts param [0, "blufor"];
private _defenders = _parts param [1, "opfor"];
private _attackersDiameter = parseNumber (_parts param [2, "1500"]);
private _defendersDiameter = parseNumber (_parts param [3, "300"]);

GVAR(adversarialAttackersDiameter) = _attackersDiameter;
publicVariable QGVAR(adversarialAttackersDiameter);

GVAR(adversarialDefendersDiameter) = _defendersDiameter;
publicVariable QGVAR(adversarialDefendersDiameter);

private _map = [
    ["b", west],
    ["o", east],
    ["i", resistance]
];

private _attackingSide = ((_map select {(_x select 0) == (toLower (_attackers select [0, 1]))}) param [0, []]) param [1, west];
private _defendingSide = ((_map select {(_x select 0) == (toLower (_defenders select [0, 1]))}) param [0, []]) param [1, east];

GVAR(adversarialAttackers) = _attackingSide;
GVAR(adversarialDefenders) = _defendingSide;

publicVariable QGVAR(adversarialAttackers);
publicVariable QGVAR(adversarialDefenders);

openMap true;

GVAR(defendersMapClickHandler) = addMissionEventHandler ["MapSingleClick", {
	params ["_units", "_pos", "_alt", "_shift"];

    GVAR(adversarialDefendersPos) = _pos;
    publicVariable QGVAR(adversarialDefendersPos);

    {
        vehicle _x setPos ([_pos, 25] call CBA_fnc_randPos);
        [vehicle _x] call FUNC(resetPosition); // Make sure they're not inside an object
    } forEach ((call CBA_fnc_players) select {side _x == GVAR(adversarialDefenders)});

    private _center = "Land_HelipadEmpty_F" createVehicle _pos;
    GVAR(adversarialSafeZones) = [[_center, GVAR(adversarialAttackersDiameter) / 2, GVAR(adversarialAttackersDiameter) / 2, 0, false, 0]];
    publicVariable QGVAR(adversarialSafeZones);

    deleteMarker QGVAR(adversarialDefendersMarker);
    private _marker = createMarker [QGVAR(adversarialDefendersMarker), _pos];
    _marker setMarkerShape "ELLIPSE";
    _marker setMarkerBrush "Border";
    _marker setMarkerColor "ColorRed";
    _marker setMarkerSize [GVAR(adversarialDefendersDiameter) / 2, GVAR(adversarialDefendersDiameter) / 2];

    deleteMarker QGVAR(adversarialAttackersMarker);
    private _marker = createMarker [QGVAR(adversarialAttackersMarker), _pos];
    _marker setMarkerShape "ELLIPSE";
    _marker setMarkerBrush "Border";
    _marker setMarkerColor "ColorBlue";
    _marker setMarkerSize [GVAR(adversarialAttackersDiameter) / 2, GVAR(adversarialAttackersDiameter) / 2];

    openMap false;

    removeMissionEventHandler ["MapSingleClick", GVAR(defendersMapClickHandler)];
}];

[true] call FUNC(randomizeEnvironment);
