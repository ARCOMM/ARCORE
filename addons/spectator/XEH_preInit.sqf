#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(isSpectating) = false;

call FUNC(setupEnvironment);

ADDON = true;
