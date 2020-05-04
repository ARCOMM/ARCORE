#include "script_component.hpp"

EXIT_IF_NOT_ARCMF;

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(commandReferenceControl) = false;
GVAR(adversarialSafeZones) = [];
GVAR(adversarialAttackers) = sideUnknown;
GVAR(adversarialDefenders) = sideUnknown;
GVAR(adversarialDefendersPos) = [];

ADDON = true;

if (isServer) then {
    if (SANDBOX_MODE) then {
        [] call FUNC(randomizeEnvironment);
    };
};
