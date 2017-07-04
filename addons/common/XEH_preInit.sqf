#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

ADDON = true;

EXIT_IF_NOT_ARCMF;

if (isServer) then {
    if ((date select 3) == 12 || {SANDBOX_MODE}) then {
        [] call FUNC(randomizeEnvironment);
    };
};
