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

class CfgMarkerColors {
    class ColorRed {
        color[] = {0.741, 0.173, 0.173, 1};
    };

    class ColorGreen {
        color[] = {0, 0.702, 0.349, 1};
    };

    class ColorBlue {
        color[] = {0.2, 0.2, 1, 1};
    };

    class ColorYellow {
        color[] = {0.839, 0.651, 0, 1};
    };
};
