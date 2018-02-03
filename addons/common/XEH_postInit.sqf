#include "script_component.hpp"

{_x call CFUNC(registerChatCommand)} forEach [
    ["common", "rp"],
    ["common", "heal"],
    ["common", "whisper"],
    ["common", "end", "admin"]
];

EXIT_IF_NOT_ARCMF;

enableSaving [false, false];
enableSentences false;

// Disable random button on Virtual Arsenal to prevent breaking ACRE
[missionNamespace, "arsenalOpened", {
    disableSerialization;
    private _display = _this select 0;
    private _button = (_display displayCtrl 44150);
    _button ctrlRemoveAllEventHandlers "buttonclick";
    _button ctrlEnable false;
    _button ctrlSetTooltip "Random is disabled because it breaks ACRE";
    _display displayAddEventHandler ["KeyDown", "if ((_this select 1) in [19,29]) then {true}"];
}] call BIS_fnc_addScriptedEventHandler;

// Set channel to side chat
setCurrentChannel 1;

if (isServer) then {
    private _freezeTime = getNumber (missionConfigFile >> "CfgARCMF" >> "General" >> "freezeTime");

    if (_freezeTime in [1,2]) then {
        setTimeMultiplier 0.1;

        if (_freezeTime == 2) then {
            [QEGVAR(briefing,endedServer), {
                setTimeMultiplier 1;
            }] call CBA_fnc_addEventHandler;
        };
    };

    if (!isNil "acex_fortify_fnc_registerObjects") then {
        private _config = (missionConfigFile >> "CfgARCMF" >> "Fortify");

        {
            _x params ["_faction", "_side"];

            private _budget = getNumber (_config >> _faction >> "budget");
            private _objects = getArray (_config >> _faction >> "objects");

            [_side, _budget, _objects] call acex_fortify_fnc_registerObjects;
        } forEach [
            ["BLUFOR", west],
            ["OPFOR", east],
            ["INDFOR", resistance],
            ["CIVILIAN", civilian]
        ];
    };
};

if (!isNil "acex_fortify_fnc_registerObjects") then {
    acex_fortify_fortifyAllowed = true;

    [QEGVAR(briefing,started), {
        acex_fortify_fortifyAllowed = true;
    }] call CBA_fnc_addEventHandler;

    [QEGVAR(briefing,ended), {
        acex_fortify_fortifyAllowed = false;
    }] call CBA_fnc_addEventHandler;
};
