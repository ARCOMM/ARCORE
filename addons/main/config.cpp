#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common", "mars_attributes"};
        author = "";
        authors[] = {"ACE Team", "Kingsley"};
        authorUrl = "http://arcomm.co";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgMarkerColors.hpp"
#include "CfgDebriefing.hpp"
#include "CfgAmmo.hpp"
