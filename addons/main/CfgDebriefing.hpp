class CfgDebriefing {
    class GVAR(completed) {
        title = "Mission Complete";
    };

    class GVAR(failed) {
        title = "Mission Failed";
    };
//We don't have a way to call this from chat commands
//Also we should definitely add a Mission "Complete" option
    class GVAR(cancelled) {
        title = "Mission Cancelled";
    };

    class GVAR(blufor) {
        title = "BLUFOR Victory";
    };

    class GVAR(opfor) {
        title = "OPFOR Victory";
    };

    class GVAR(indfor) {
        title = "INDFOR Victory";
    };

    class GVAR(civilian) {
        title = "Civilian Victory";
    };

    class GVAR(draw) {
        title = "Draw";
    };
};
