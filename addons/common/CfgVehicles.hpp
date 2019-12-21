class CfgFactionClasses {
    class NO_CATEGORY;
    class ARCOMM: NO_CATEGORY {
        displayName = "ARCOMM";
        priority = 2;
        side = 7;
    };
};

class CfgVehicleClasses {
    class ARCOMM_Vehicles {
        displayName = "ARCOMM Vehicles";
    };
};

class CfgVehicles {
    class ACE_Module;
    class GVAR(adversarialSafeZone): ACE_Module {
        author = "ARCOMM";
        category = "ARCOMM";
        displayName = "Adversarial Safe Zone";
        scope = 2;
        isGlobal = 1;
        canSetArea = 1;
        function = QFUNC(adversarialSafeZoneModule);
        class AttributeValues {
            size3[] = {750, 750, -1};
            IsRectangle = 0;
        };
    };
};
