/*
 * Author: Kingsley
 * Handles the camera movement.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call arcore_spectator_fnc_handleCamera;
 *
 * Public: No
 */

#include "script_component.hpp"

GVAR(camCamera) camSetFov GVAR(camFovZoom);

if (GVAR(camMode) == 0) then {
    cameraEffectEnableHUD true;

    private _commitTime = ((1.0 - ((speed vehicle GVAR(camCurrentTarget)) / 65)) / 3) max 0.1;
    private _delta = -(2 * (0.3 max GVAR(camZoom)));
    private _zLevel = sin(GVAR(camAngleY)) * (2 * (0.3 max GVAR(camZoom)));
    private _visPos = visiblePositionASL GVAR(camCurrentTarget);

    if (!surfaceIsWater _visPos) then {_visPos = ASLtoATL _visPos};

    GVAR(camFakeCamera) camSetPos [_visPos select 0, _visPos select 1, (_visPos select 2) + 1.5];
    GVAR(camFakeCamera) camCommit _commitTime;

    GVAR(camCamera) camSetRelPos[
        (sin GVAR(camAngleX) * _delta) * cos GVAR(camAngleY),
        (cos GVAR(camAngleX) * _delta) * cos GVAR(camAngleY),
        _zLevel
    ];

    GVAR(camCamera) camCommit _commitTime;
};

if (GVAR(camMode) == 1) then {
    if (vehicle cameraOn != cameraOn) then {
        private _mode = "internal";
        if (gunner (vehicle cameraOn) == cameraOn) then {_mode = "gunner"};
        if (driver (vehicle cameraOn) == cameraOn) then {_mode = "gunner"};
        if (commander (vehicle cameraOn) == cameraOn) then {_mode = "gunner"};
        vehicle cameraOn switchCamera _mode;
    };

    if (vehicle cameraOn == cameraOn && !GVAR(camAds)) then {
        cameraOn switchCamera "internal";
    };
};

if (GVAR(camMode) == 2) then {
    GVAR(camFreeCamera) camSetFov GVAR(camFovZoom);

    private _delta = (time - GVAR(camTimestamp)) * 10;
    private _currPos = getposASL GVAR(camFreeCamera);
    private _inBuilding = [_currPos] call CFUNC(inBuilding);
    private _mX = 0;
    private _mY = 0;
    private _mZ = 0;

    private _height = 0 max ((getPosATL GVAR(camFreeCamera)) select 2);
    private _accel = 0.1 max (_height / ([10, 35] select _inBuilding));
    private _accelshift = _accel * 4.25;

    if (GVAR(camButtons) select 0) then { // W
        if (GVAR(camShiftDown)) then {
            _mY = _accelshift;
        } else {
            _mY = _accel;
        };
    };

    if (GVAR(camButtons) select 1) then { // S
        if (GVAR(camShiftDown)) then {
            _mY = -_accelshift;
        } else {
            _mY = -_accel;
        };
    };

    if (GVAR(camButtons) select 2) then { // A
        if (GVAR(camShiftDown)) then {
            _mX = -_accelshift;
        } else {
            _mX = -_accel;
        };
    };

    if (GVAR(camButtons) select 3) then { // D
        if (GVAR(camShiftDown)) then {
            _mX = _accelshift;
        } else {
            _mX = _accel;
        };
    };

    if (GVAR(camButtons) select 4) then { // Q
        _scroll = 1 * ((sqrt _height) / 2) * _delta;

        if (abs _scroll < 0.1) then {
            if (_scroll < 0) then {
                _scroll = -0.1;
            } else {
                _scroll = 0.1;
            };
        };

        _mZ = _scroll;
    };

    if (GVAR(camButtons) select 5) then { // Z
        _scroll = -1 * ((sqrt _height) / 2) * _delta;

        if (abs _scroll < 0.1) then {
            if (_scroll < 0) then {
                _scroll = -0.1;
            } else {
                _scroll = 0.1;
            };
        };

        _mZ = _scroll;
    };

    if (GVAR(camScrollHeight) < 0 || GVAR(camScrollHeight) > 0) then {
        _scroll = -GVAR(camScrollHeight) * _delta * 3;
        GVAR(camScrollHeight) = _scroll;

        if (GVAR(camScrollHeight) < 0.2 && GVAR(camScrollHeight) > -0.2) then {
            GVAR(camScrollHeight) = 0;
        };

        _scroll = _scroll * ((sqrt _height) / 2);

        if (abs _scroll < 0.1) then {
            if (_scroll < 0) then {
                _scroll = -0.1;
            } else {
                _scroll = 0.1;
            };
        };

        _mZ = _mZ + _scroll;
    };

    // Max speed 50 m/s
    _mX = _delta * ((_mX min 50) max -50);
    _mY = _delta * ((_mY min 50) max -50);

    GVAR(camFreeCameraSpeedX) = GVAR(camFreeCameraSpeedX) * 0.5 + _mX;
    GVAR(camFreeCameraSpeedY) = GVAR(camFreeCameraSpeedY) * 0.5 + _mY;
    GVAR(camFreeCameraSpeedZ) = GVAR(camFreeCameraSpeedZ) * 0.5 + (_mZ * (_accel min ([1.5, 5] select GVAR(camShiftDown))));

    _x = (_currPos select 0) + (GVAR(camFreeCameraSpeedX) * (cos GVAR(camAngleX))) + (GVAR(camFreeCameraSpeedY) * (sin GVAR(camAngleX)));
    _y = (_currPos select 1) - (GVAR(camFreeCameraSpeedX) * (sin GVAR(camAngleX))) + (GVAR(camFreeCameraSpeedY) * (cos GVAR(camAngleX)));
    _newHeight = getTerrainHeightASL [_x, _y];
    _z = ((_currPos select 2) + GVAR(camFreeCameraSpeedZ)) min (1000 + _newHeight);

    GVAR(camFreeCamera) setPosASL [_x, _y, _z max _newHeight];
    GVAR(camFreeCamera) setDir GVAR(camAngleX);
    [GVAR(camFreeCamera), GVAR(camAngleY), 0] call BIS_fnc_setPitchBank;
    GVAR(camScrollHeight) = 0;
    GVAR(camTimestamp) = time;
};

cameraEffectEnableHUD true;
showCinemaBorder false;
