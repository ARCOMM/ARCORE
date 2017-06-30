#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author = "";
        authors[] = {"ACE Team", "Kingsley"};
        authorUrl = "http://arcomm.co";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
