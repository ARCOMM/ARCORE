/*
 * Author: Kingsley
 * Opens the spectator interface.
 *
 * Arguments:
 * Respawn event arguments.
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, objNull, 1, 3, true] call arcore_spectator_fnc_init;
 *
 * Public: No
 */

#include "script_component.hpp"

_this spawn {
    params [
        ["_unit", objNull],
        ["_oldUnit", objNull],
        ["_respawn", 1],
        ["_respawnDelay", 3],
        ["_forced", false]
    ];

    // Setup the environment variables
    call FUNC(setupEnvironment);

    if (isNull _unit) then {_unit = cameraOn};
    if (typeOf _unit != "seagull" && !_forced || !hasInterface) exitWith {};
    waituntil {missionNamespace getVariable ["BIS_fnc_feedback_allowDeathScreen", true] || isNull _oldUnit || _forced};

    // Leave the group
    private _group = group _unit;
    [player, _unit, _oldUnit] joinSilent grpNull;

    // Delete the group if no one is left
    if (count units _group == 0) then {
        deleteGroup _group;
    };

    // Setup dummy unit
    private _dummyGroup = createGroup playerSide;
    _dummyGroup setVariable [QGVAR(virtual), true, true];
    _dummyGroup setVariable [QEGVAR(group,enabled), false, true];

    private _dummyUnit = _dummyGroup createUnit [typeOf player, [0, 0, 25], [], 0, "FORM"];
    _dummyUnit setName (name player);
    _dummyUnit setUnitLoadout [getUnitLoadout player, true];
    _dummyUnit allowDamage false;
    _dummyUnit enableSimulation false;
    _dummyUnit setPosASL [0, 0, 25];

    // Switch into dummy unit
    selectPlayer _dummyUnit;
    waitUntil {player == _dummyUnit};

    // Set any variables on the new unit
    player setVariable [QGVAR(virtual), true, true];
    player setVariable [QGVAR(rejoin), false, true];

    // Create the briefings and roster
    [side player] call EFUNC(briefing,createBriefing);
    [] call EFUNC(briefing,createFrameworkBriefing);
    [side player] call EFUNC(group,createRoster);

    // Delete the real unit
    deleteVehicle _unit;

    // Remove ACRE radios
    if (!isNil "acre_api_fnc_getCurrentRadioList") then {
        {player removeItem _x} forEach ([] call acre_api_fnc_getCurrentRadioList);
    };

    // Make sure there is a unit to target
    if (isNull _oldUnit) then {
        if !(playableUnits isEqualTo []) then {
            _oldUnit = playableUnits select 0;
        } else {
            _oldUnit = allUnits select 0;
        };
    };

    GVAR(isSpectating) = true;
    GVAR(forceExit) = false;

    // Post Processing
    if (!isNil "BIS_fnc_feedback_allowPP") then {
        BIS_fnc_feedback_allowPP = false;
    };

    // ACRE
    if (!isNil "acre_api_fnc_setSpectator") then {
        [true] call acre_api_fnc_setSpectator;
    };

    // Chat
    // TODO
    // ["Use Spectator Channel to Chat", -1, -1, 4, 0] spawn BIS_fnc_dynamicText;

    createDialog QGVAR(Dialog);

    call FUNC(autoSizeControls);

    private _camStartPos = getPos _oldUnit;
    _camStartPos set [2, 3];

    GVAR(camCamera) = "camera" camCreate _camStartPos;
    GVAR(camFakeCamera) = "camera" camCreate _camStartPos;
    GVAR(camFreeCamera) = "camera" camCreate _camStartPos;
    GVAR(camCurrentTarget) = _oldUnit;
    GVAR(camCamera) camCommit 0;
    GVAR(camFakeCamera) camCommit 0;
    GVAR(camCamera) cameraEffect ["internal", "back"];
    GVAR(camCamera) camSetTarget GVAR(camFakeCamera);
    GVAR(camCamera) camSetFov 1.2;
    GVAR(camFreeCamera) camSetFov 1.2;

    cameraEffectEnableHUD true;
    showCinemaBorder false;

    call FUNC(updateUnitList);

    GVAR(pfhCamera) = [FUNC(handleCamera)] call CBA_fnc_addPerFrameHandler;
    GVAR(pfhTags) = [FUNC(drawTags)] call CBA_fnc_addPerFrameHandler;
};
