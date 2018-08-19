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

    class Bag_Base;
    class usm_pack_alice: Bag_Base {};

    class usm_pack_m5_medic: Bag_Base {
        delete TransportItems;
        delete TransportMagazines;
    };

    class usm_pack_200rnd_556_bandoliers: Bag_Base {
        delete TransportMagazines;
    };

    class usm_pack_762x51_ammobelts: Bag_Base {
        delete TransportMagazines;
    };

    class usm_pack_762x51_bandoliers: Bag_Base {
        delete TransportMagazines;
    };

    class usm_pack_alice_prc119: Bag_Base {
        delete TransportMagazines;
    };

    class usm_pack_alice_prc77: Bag_Base {
        delete TransportMagazines;
    };

    class usm_pack_st138_prc77: Bag_Base {
        delete TransportMagazines;
    };

    class usm_pack_alice_medic: usm_pack_alice {
        delete TransportItems;
        delete TransportMagazines;
    };
};
