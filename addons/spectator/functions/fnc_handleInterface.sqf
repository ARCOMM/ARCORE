/*
 * Author: Kingsley
 * Handles the camera movement.
 */

#include "script_component.hpp"

params ["_type", "_args"];

private _handled = true;

switch (_type) do {
    case "MouseButtonDown": {
        if (_args select 1 == 1 && GVAR(camMode) != 1) then {
            _button = _args select 1;
            GVAR(camMouseButton) set [_button, true];
        };

        if (_args select 1 == 1) then {
            if (GVAR(camMode) == 1) then {
                GVAR(camAds) = true;
                GVAR(camCurrentTarget) switchCamera "gunner";
            };
        };
    };

    case "MouseButtonUp": {
        if (_args select 1 == 1 && GVAR(camMode) != 1) then {
            _button = _args select 1;
            GVAR(camMouseButton) set [_button, false];
            call FUNC(computeCamera);
        };

        if (_args select 1 == 1) then {
            if (GVAR(camMode) == 1) then {
                GVAR(camAds) = false;
                GVAR(camCurrentTarget) switchCamera "internal";
            };
        };
    };

    case "MouseMoving": {
        private _x = _args select 1;
        private _y = _args select 2;
        GVAR(camMouseCord) = [_x, _y];
        call FUNC(computeCamera);
    };

    case "MouseZChanged": {
        if (!GVAR(camCtrlDown)) then {
            switch (GVAR(camMode)) do {
                case 0: {
                    GVAR(camZoom) = ((GVAR(camZoom) - ((_args select 1) * GVAR(camZoom) / 5)) max 0.1) min 650;
                };
                case 3: {
                    GVAR(camScrollHeight) = (_args select 1);
                };
            };
        } else {
            GVAR(camFovZoom) = ((GVAR(camFovZoom) - ((_args select 1) * GVAR(camFovZoom) / 5)) max 0.1) min 1;
        };
    };

    case "TreeSelChanged": {
        _args params ["_ctrlTree", "_path"];
        private _type = _ctrlTree tvValue _path;
        if !(_type in [0,1]) exitWith {true};
        private _key = _ctrlTree tvData _path;
        private _unit = if (_type == 0) then {
            leader ((allGroups select {format ["%1_%2", side _x, groupID _x] == _key}) param [0, grpNull])
        } else {
            _key call BIS_fnc_objectFromNetId
        };

        if (GVAR(camMode) == 0 || GVAR(camMode) == 1) then {
            GVAR(camCurrentTarget) = _unit;
            if (GVAR(camToggleCamera)) then {GVAR(camCurrentTarget) switchCamera "INTERNAL"};
        };

        if (GVAR(camMode) == 3) then {
            private _pos = getPos _unit;
            private _x = _pos select 0;
            private _y = _pos select 1;
            GVAR(camFreeCamera) setPosASL [_x, _y, ((getPosASL GVAR(camFreeCamera)) select 2 ) max ((getTerrainHeightASL [_x, _y]) + 1)];
        };
    };

    case "KeyDown": {
        private _key = _args select 1;
        _handled = false;
        if (!isNull (findDisplay 49)) exitWith {if (_key == 1) then {true}};

        switch (_key) do {
            // Numpad +
            case 78: {
                GVAR(camZoom) = GVAR(camZoom) - 1;
                _handled = true;
            };

            case 1: {
                _handled = false;
            };

            // Numpad -
            case 74: {
                GVAR(camZoom) = GVAR(camZoom) + 1;
                GVAR(camZoom) = 0.3 max GVAR(camZoom);
                _handled = true;
            };

            // U
            case 22: {
                GVAR(camHideUi) = !GVAR(camHideUi);
                call FUNC(toggleInterface);
                _handled = true;
            };

            // W
            case 17: {
                GVAR(camButtons) set [0, true];
                _handled = true;
            };

            // S
            case 31: {
                GVAR(camButtons) set [1, true];
                _handled = true;
            };

            // A
            case 30: {
                GVAR(camButtons) set [2, true];
                _handled = true;
            };

            // D
            case 32: {
                GVAR(camButtons) set [3, true];
                _handled = true;
            };

            // N
            case 49: {
                if (GVAR(nvOn)) then {
                    GVAR(tiWhOn) = true;
                    GVAR(tiBhOn) = false;
                    GVAR(nvOn) = false;
                    true setCamUseTi 0;
                    camUseNVG false;
                } else {
                    if (GVAR(tiWhOn)) then {
                        GVAR(tiWhOn) = false;
                        GVAR(tiBhOn) = true;
                        GVAR(nvOn) = false;
                        true setCamUseTi 1;
                        camUseNVG false;
                    } else {
                        if (GVAR(tiBhOn)) then {
                            GVAR(tiWhOn) = false;
                            GVAR(tiBhOn) = false;
                            GVAR(nvOn) = false;
                            false setCamUseTi 0;
                            camUseNVG false;
                        } else {
                            if (!GVAR(nvOn)) then {
                                camUseNVG true;
                                GVAR(tiWhOn) = false;
                                GVAR(tiBhOn) = false;
                                GVAR(nvOn) = true;
                                false setCamUseTi 0;
                            };
                        };
                    };
                };

                _handled = true;
            };

            // Q
            case 16: {
                GVAR(camButtons) set [4, true];
                _handled = true;
            };

            // Z
            case 44: {
                GVAR(camButtons) set [5, true];
                _handled = true;
            };

            // Space
            case 57: {
                GVAR(camFreeCameraOn) = !GVAR(camFreeCameraOn);

                if (GVAR(camFreeCameraOn)) then {
                    GVAR(camAngleY) = 10;
                    [GVAR(camFreeCamera), GVAR(camAngleY), 0] call BIS_fnc_setPitchBank;
                    GVAR(camFreeCamera) cameraEffect ["internal", "BACK"];
                    GVAR(camMode) = 3;
                    GVAR(camFreeCamera) setPosASL (getPosASL GVAR(camCamera));
                    cameraEffectEnableHUD true;
                    showCinemaBorder false;
                } else {
                    GVAR(camFreeCamera) cameraEffect ["Terminate", "BACK"];
                    GVAR(camAngleY) = 45;
                    GVAR(camCamera) cameraEffect ["internal", "BACK"];
                    GVAR(camMode) = 0;
                    cameraEffectEnableHUD true;
                    showCinemaBorder false;
                };

                _handled = true;
            };

            // Shift
            case 42: {
                GVAR(camShiftDown) = true;
                call FUNC(computeCamera);
                _handled = true;
            };

            // Ctrl
            case 29: {
                GVAR(camCtrlDown) = true;
                call FUNC(computeCamera);
                _handled = true;
            };
        };

        _handled
    };

    case "KeyUp": {
        if (!isNull (findDisplay 49)) exitWith {};
        _key = _args select 1;
        _handled = false;

        switch (_key) do {
            case 42: {
                GVAR(camShiftDown) = false;
                _handled = true;
            };

            case 29: {
                GVAR(camCtrlDown) = false;
                _handled = true;
            };

            case 1;
            case 203;
            case 205;
            case 24;
            case 28;
            case 49;
            case 200;
            case 208;
            case 74;
            case 78;
            case 57: {
                _handled = true;
            };

            case 17: {
                GVAR(camButtons) set [0, false];
                _handled = true;
            };

            case 31: {
                GVAR(camButtons) set [1, false];
                _handled = true;
            };

            case 30: {
                GVAR(camButtons) set [2, false];
                _handled = true;
            };

            case 32: {
                GVAR(camButtons) set [3, false];
                _handled = true;
            };

            case 16: {
                GVAR(camButtons) set [4, false];
                _handled = true;
            };

            case 44: {
                GVAR(camButtons) set [5, false];
                _handled = true;
            };

            case 23: {
                GVAR(camToggleTags) = !GVAR(camToggleTags);
                _handled = true;
            };

            case 43: {
                call FUNC(exit);

                [{
                    [player, objNull, 1, 1, true] call FUNC(init);
                }, [], 2] call CBA_fnc_waitAndExecute;
            };
        };

        _handled
    };

    _handled
};
