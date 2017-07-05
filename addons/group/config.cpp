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
#include "CfgEden.hpp"

class CfgMarkers {
    #define MARKER(TYPE, PATH)\
        class GVAR(TYPE) {\
            name = QGVAR(TYPE);\
            icon = PATH;\
            color[] = {0,0,0,1};\
            size = 24;\
            scope = 0;\
            shadow = "false";\
        }

    MARKER(Rifleman, "\A3\ui_f\data\map\vehicleicons\iconMan_ca.paa");
    MARKER(Medic, "\A3\ui_f\data\map\vehicleicons\iconManMedic_ca.paa");
    MARKER(Engineer, "\A3\ui_f\data\map\vehicleicons\iconManEngineer_ca.paa");
    MARKER(Explosive, "\A3\ui_f\data\map\vehicleicons\iconManExplosive_ca.paa");
    MARKER(Recon, "\A3\ui_f\data\map\vehicleicons\iconManRecon_ca.paa");
    MARKER(AT, "\A3\ui_f\data\map\vehicleicons\iconManAT_ca.paa");
    MARKER(Leader, "\A3\ui_f\data\map\vehicleicons\iconManLeader_ca.paa");
    MARKER(MG, "\A3\ui_f\data\map\vehicleicons\iconManMG_ca.paa");
    MARKER(Officer, "\A3\ui_f\data\map\vehicleicons\iconManOfficer_ca.paa");
};
