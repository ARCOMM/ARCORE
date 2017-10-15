class CfgWeapons {
    class ACRE_BaseRadio;

    #define FIX_RADIO_MASS(CNAME)\
        class CNAME: ACRE_BaseRadio {\
            class ItemInfo {\
                mass = 0;\
                scope = 0;\
                type = 302;\
            };\
        }

    FIX_RADIO_MASS(ACRE_PRC117F);
    FIX_RADIO_MASS(ACRE_PRC148);
    FIX_RADIO_MASS(ACRE_PRC152);
    FIX_RADIO_MASS(ACRE_PRC343);
    FIX_RADIO_MASS(ACRE_PRC77);
    FIX_RADIO_MASS(ACRE_SEM52SL);
};
