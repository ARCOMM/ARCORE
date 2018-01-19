#include "script_component.hpp"

if (!hasInterface) exitWith {};

["ARCOMM", "OpenClientMenu", ["Open Client Menu", "Press to open the client menu"], {
    call FUNC(openMenu);
}, ""] call CBA_fnc_addKeybind;

[GVAR(terrainDetail)] call FUNC(setTerrainDetail);
[GVAR(viewDistance)] call FUNC(setViewDistance);
