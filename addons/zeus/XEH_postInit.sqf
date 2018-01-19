#include "script_component.hpp"

["ACRE", "Enable Spectator", {
    call EFUNC(acre,enableSpectator);
}] call Ares_fnc_RegisterCustomModule;

["ACRE", "Disable Spectator", {
    call EFUNC(acre,disableSpectator);
}] call Ares_fnc_RegisterCustomModule;

if (isServer) then {
    GVAR(zeusCenter) = createCenter sideLogic;
};

if (isNil QGVAR(zeusModule)) then {
    GVAR(zeusModule) = objNull;
};
