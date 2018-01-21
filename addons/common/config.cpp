#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"arcore_main"};
        author = "";
        authors[] = {"Kingsley"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgEden.hpp"
