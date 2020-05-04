#include "script_component.hpp"

EXIT_IF_NOT_ARCMF;

[QGVAR(execute), {
    params ["_code", "_args"];
    _args call _code;
}] call CBA_fnc_addEventHandler;

{_x call CFUNC(registerChatCommand)} forEach [
    ["common", "rp"],
    ["common", "tp"],
    ["common", "heal"],
    ["common", "whisper"],
    ["common", "end"],
    ["common", "stage"],
    ["common", "ad"]
];

if (isMultiplayer) then {
    call FUNC(handleGamma);
};

["ace_unconscious", {
	params [
        ["_unit", objNull],
        ["_state", false]
    ];

	if (_state && {vehicle _unit == _unit
        && {!([_unit] call ace_medical_fnc_isBeingCarried)
        && {!([_unit] call ace_medical_fnc_isBeingDragged)}}}
    ) then {
		_unit setUnconscious true;
	};

	if (!_state) then {
		_unit setUnconscious false;
	};
}] call CBA_fnc_addEventHandler;

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

if (isMultiplayer) then {
    call FUNC(chatCommandReference);

    ["cba_events_chatMessageSent", {
        ctrlDelete ((findDisplay 46) displayCtrl COMMAND_REF_IDC);
        GVAR(commandReferenceControl) = false;
    }] call CBA_fnc_addEventHandler;
};

if !(GVAR(adversarialDefendersPos) isEqualTo []) then {
    if (side player == GVAR(adversarialDefenders)) then {
        player setPos GVAR(adversarialDefendersPos);
        [player] call FUNC(resetPosition);
    };
};
