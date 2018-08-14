#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(commandReferenceControl) = false;
GVAR(adversarialSafeZones) = [];

ADDON = true;

EXIT_IF_NOT_ARCMF;

if (isServer) then {
    if (SANDBOX_MODE) then {
        [] call FUNC(randomizeEnvironment);
    };
};
