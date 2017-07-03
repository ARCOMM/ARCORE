#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"arcore_common"};
        author = "";
        authors[] = {"Kingsley"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "UI\interface.hpp"

class CfgRespawnTemplates {
    class ADDON {
        onPlayerRespawn = QFUNC(init);
    };

    class Seagull {
        onPlayerRespawn = "";
    };
};
