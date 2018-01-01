#include "script_component.hpp"

EXIT_IF_NOT_ARCMF;

_trafficEnabled = getNumber (getMissionConfig "CfgARCMF" >> "Ambient" >> "Traffic" >> "enabled");
_civiliansEnabled = getNumber (getMissionConfig "CfgARCMF" >> "Ambient" >> "Civilians" >> "enabled");

if (_trafficEnabled > 0 && isServer) then {
    [] call FUNC(initTraffic);
};

if (_civiliansEnabled > 0 && hasInterface) then {
    [] call FUNC(initPlayer);
};
