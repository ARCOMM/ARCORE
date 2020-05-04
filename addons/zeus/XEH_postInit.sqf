#include "script_component.hpp"

EXIT_IF_NOT_ARCMF;

["ACRE", "Enable Spectator", {
    call EFUNC(acre,enableSpectator);
}] call Ares_fnc_RegisterCustomModule;

["ACRE", "Disable Spectator", {
    call EFUNC(acre,disableSpectator);
}] call Ares_fnc_RegisterCustomModule;

if (isServer) then {
    GVAR(zeusCenter) = createCenter sideLogic;
};

if (isNil QGVAR(zeusModule1)) then {
    GVAR(zeusModule1) = objNull;
};

if (isNil QGVAR(zeusModule2)) then {
    GVAR(zeusModule2) = objNull;
};

["Achilles_onLoadCuratorInterface", {
    private _module = getAssignedCuratorLogic player;
    private _emitted = _module getVariable [QGVAR(setupEmitted), false];

    if (!_emitted) then {
        [QGVAR(moduleSetup), [_module]] call CBA_fnc_localEvent;
        _module setVariable [QGVAR(setupEmitted), true, true];
    };
}] call CBA_fnc_addEventHandler;
