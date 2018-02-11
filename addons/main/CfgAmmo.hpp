class CfgAmmo {
    class FlareCore;
    class FlareBase: FlareCore {};

    class Flare_82mm_AMOS_White: FlareCore {
        intensity = 1250000;
    };

    class F_40mm_White: FlareBase {
        intensity = 1250000;
        timeToLive = 40;
        coefGravity = 0.25;
    };
};
