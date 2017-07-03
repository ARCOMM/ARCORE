#include "script_component.hpp"

{_x call CFUNC(registerChatCommand)} forEach [
    ["common", "rp"],
    ["common", "heal"],
    ["common", "whisper"],
    ["common", "spec"]
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
    if ((date select 3) == 12 || {getNumber (missionConfigFile >> "Header" >> "sandbox") == 1}) then {
        [] call FUNC(randomizeEnvironment);
    };

    if (getNumber (missionConfigFile >> "CfgARCMF" >> "General" >> "freezeTime") in [1,2]) then {
        setTimeMultiplier 0.1;
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
