class CfgVehicles {
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
