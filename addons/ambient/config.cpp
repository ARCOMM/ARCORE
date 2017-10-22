#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"arcore_common"};
        author = "";
        authors[] = {"Jay"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
