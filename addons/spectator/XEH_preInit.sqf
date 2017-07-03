#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(isSpectating) = false;

GVAR(camMode) = 0;
GVAR(camMouseButton) = [false, false];
GVAR(camAds) = false;
GVAR(camCurrentTarget) = objNull;
GVAR(camMouseCord) = [0, 0];
GVAR(camCtrlDown) = false;
GVAR(camShiftDown) = false;
GVAR(camZoom) = 3;
GVAR(camScrollHeight) = 0;
GVAR(camFovZoom) = 1.2;
GVAR(camListUnits) = [];
GVAR(camToggleCamera) = false;
GVAR(camCamera) = objNull;
GVAR(camFreeCamera) = objNull;
GVAR(camFreeCameraOn) = false;
GVAR(camHideUi) = false;
GVAR(camButtons) = [false, false, false, false, false, false];
GVAR(camAngleX) = 0;
GVAR(camAngleY) = 60;
GVAR(camToggleTags) = false;
GVAR(camMouseDeltaX) = 0.5;
GVAR(camMouseDeltaY) = 0.5;
GVAR(camMouseLastX) = 0.5;
GVAR(camMouseLastY) = 0.5;

GVAR(nvOn) = false;
GVAR(tiWhOn) = false;
GVAR(tiBhOn) = false;

ADDON = true;
