#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(isSpectating) = false;

GVAR(forceExit) = false;
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
GVAR(camFreeCameraSpeedX) = 0;
GVAR(camFreeCameraSpeedY) = 0;
GVAR(camFreeCameraSpeedZ) = 0;
GVAR(camListUnits) = [];
GVAR(camToggleCamera) = false;
GVAR(camCamera) = objNull;
GVAR(camFakeCamera) = objNull;
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
GVAR(camTagsButton) = 0;
GVAR(camTagsNames) = ["TAGS (OFF)","TAGS (ALL SIDES)","TAGS (ALL PLAYERS)","TAGS (BLUFOR)","TAGS (OPFOR)","TAGS (INDFOR)","TAGS (CIV)"];
GVAR(camTracersButton) = 0;
GVAR(camTracersNames) = ["3D TRACERS (OFF)", "3D TRACERS (PLAYERS)", "3D TRACERS (AI)", "3D TRACERS (BOTH)"];
GVAR(camUnitListShow) = true;
GVAR(camAllControls) = [IDC_ENTERBOX, IDC_UNITBOX, IDC_UNITLISTBUTTON, IDC_UNITLISTREFRESH, IDC_TAGSNAMEBUTTON, IDC_TRACERSBUTTON, IDC_FIRSTPERSONBUTTON, IDC_RESPAWNBUTTON];
GVAR(camMenuControls) = [IDC_UNITLISTREFRESH, IDC_TAGSNAMEBUTTON, IDC_TRACERSBUTTON, IDC_FIRSTPERSONBUTTON, IDC_RESPAWNBUTTON];
GVAR(camMenuButtonWidth) = safeZoneW / count GVAR(camMenuControls);
GVAR(camMenuButtonX) = 0 * safeZoneW + safeZoneX;
GVAR(camTimestamp) = time;
GVAR(camColorWest) = [0.2, 0.2, 1, 1];
GVAR(camColorEast) = [1, 0.2, 0.2, 1];
GVAR(camColorResistance) = [0, 0.702, 0.349, 1];
GVAR(camColorCiv) = [civilian] call BIS_fnc_sideColor;
GVAR(camColorEmpty) = [sideUnknown] call BIS_fnc_sideColor;

GVAR(nvOn) = false;
GVAR(tiWhOn) = false;
GVAR(tiBhOn) = false;

ADDON = true;
