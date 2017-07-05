class GVAR(Button) {
    access = 0;
    borderSize = 0;
    colorBorder[] = PRIMARYCOLOR;
    colorBackgroundActive[] = ARCRED;
    colorBackgroundDisabled[] = {0,0,0,0.75};
    colorDisabled[] = {0.4,0.4,0.4,1};
    colorFocused[] = BACKGROUND_COLOR;
    colorShadow[] = PRIMARYCOLOR;
    colorText[] = PRIMARYCOLOR;
    color[] = {1,1,1,1};
    colorBackground[] = BACKGROUND_COLOR;
    font = "RobotoCondensed";
    offsetPressedX = 0;
    offsetPressedY = 0;
    offsetX = 0;
    offsetY = 0;
    shadow = 0;
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.005)";
    soundClick[] = {"\A3\ui_f\data\sound\rscbutton\soundClick",0.09,1};
    soundEnter[] = {"\A3\ui_f\data\sound\rscbutton\soundEnter",0.09,1};
    soundEscape[] = {"\A3\ui_f\data\sound\rscbutton\soundEscape",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\rscbutton\soundPush",0.09,1};
    style = 0x02 + 160;
    text = "";
    type = 1;
    blinkingPeriod = 0;
    tooltipColorShade[] = BACKGROUND_COLOR;
    tooltipColorText[] = PRIMARYCOLOR;
    tooltipColorBox[] = BACKGROUND_COLOR;
    h = 0.039216;
    w = 0.095589;
    x = 0;
    y = 0;
};

class GVAR(ControlsGroup) {
    x = 0;
    y = 0;
    w = 1;
    h = 1;
    idc = -1;
    style = 0;
    type = 15;

    class VScrollbar  {
        width = 0.021000;
        autoScrollDelay = 5;
        color[] = {1,1,1,1 };
        autoScrollSpeed = -1;
        autoScrollRewind = 0;
    };

    class HScrollbar {
        height = 0.028;
        color[] = {1, 1, 1, 1};
    };

    class ListScrollBar  {
        shadow = 0;
        color[] = {1,1,1,0.6};
        colorActive[] = {1,1,1,1};
        colorDisabled[] = {1,1,1,0.3};
        thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
        border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
        arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
        arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
    };

    class Controls {};
};

class GVAR(Dialog) {
    idd = IDC_DIALOG;
    enableSimulation = 1;
    enableDisplay = 1;
    closeOnMissionEnd = 1;
    movingEnable = 0;
    onKeyDown = QUOTE([ARR_2('KeyDown', _this)] call FUNC(handleInterface));
    onKeyUp = QUOTE([ARR_2('KeyUp', _this)] call FUNC(handleInterface));
    onUnload = QUOTE([] spawn FUNC(unload));

    class ControlsBackground {
        class MouseHandler: GVAR(ControlsGroup) {
            idc = IDC_MOUSEHANDLER;
            x = SafeZoneX; y = SafeZoneY;
            w = SafeZoneW; h = SafeZoneH;
            colorBackground[] = {0.2, 0.0, 0.0, 0.0};
            onMouseButtonDown = QUOTE([ARR_2('MouseButtonDown', _this)] call FUNC(handleInterface));
            onMouseButtonUp = QUOTE([ARR_2('MouseButtonUp', _this)] call FUNC(handleInterface));
            onMouseZChanged = QUOTE([ARR_2('MouseZChanged', _this)] call FUNC(handleInterface));
            onMouseMoving = QUOTE([ARR_2('MouseMoving', _this)] call FUNC(handleInterface));

            class ListScrollBar {
                color[] = {1,1,1,0.6};
                colorActive[] = {1,1,1,1};
                colorDisabled[] = {1,1,1,0.0};
                thumb = "";
                arrowFull = "";
                arrowEmpty = "";
                border = "";
            };
        };

        class OnEnterBox: GVAR(Button) {
            idc = IDC_ENTERBOX;
            x = -0.1 * safezoneW + safezoneX;
            y = -0.1 * safezoneH + safezoneY;
            w = 0.4 * safezoneW;
            h = 0.2 * safezoneH;
            borderSize = 0;
            colorBorder[] = {0,0,0,0};
            colorBackgroundActive[] = {0,0,0,0};
            colorBackgroundDisabled[] = {0,0,0,0};
            colorDisabled[] = {0,0,0,0};
            colorFocused[] = {0,0,0,0};
            colorShadow[] = {0,0,0,0};
            colorText[] = {0,0,0,0};
            color[] = {0,0,0,0};
            colorBackground[] = {0,0,0,0};
        };
    };

    class Controls {
        class GVAR(UnitBox) {
            idc = IDC_UNITBOX;
            x = 0 * safezoneW + safezoneX;
            y = 0.03 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.97 * safezoneH;
            access = 0;
            blinkingPeriod = 0;
            colorArrow[] = {0,0,0,0};
            colorBackground[] = BACKGROUND_COLOR;
            colorBorder[] = {0,0,0,0};
            colorDisabled[] = {0,0,0,0};
            colorLines[] = {0,0,0,0};
            colorMarked[] = ARCRED;
            colorMarkedSelected[] = ARCRED;
            colorMarkedText[] = {1,1,1,1};
            colorPicture[] = {1,1,1,1};
            colorPictureDisabled[] = {1,1,1,0.25};
            colorPictureRight[] = {1,1,1,1};
            colorPictureRightDisabled[] = {1,1,1,0.25};
            colorPictureRightSelected[] = {1,1,1,1};
            colorPictureSelected[] = {1,1,1,1};
            colorSearch[] = ARCRED;
            colorSelect[] = ARCRED;
            colorSelectText[] = {1,1,1,1};
            colorText[] = {1,1,1,1};
            default = 0;
            deletable = 0;
            disableKeyboardSearch = 1;
            expandedTexture = "\a3\3DEN\Data\Controls\ctrlTree\expandedTexture_ca.paa";
            expandOnDoubleclick = 1;
            fade = 0;
            font = "RobotoCondensedLight";
            hiddenTexture = "\a3\3DEN\Data\Controls\ctrlTree\hiddenTexture_ca.paa";
            maxHistoryDelay = 1;
            multiselectEnabled = 0;
            onCanDestroy = "";
            onDestroy = "";
            onKeyDown = "";
            onKeyUp = "";
            onKillFocus = "";
            onMouseButtonClick = "";
            onMouseButtonDblClick = "";
            onMouseButtonDown = "";
            onMouseButtonUp = "";
            onMouseEnter = "";
            onMouseExit = "";
            onMouseHolding = "";
            onMouseMoving = "";
            onMouseZChanged = "";
            onSetFocus = "";
            onTreeCollapsed = "";
            onTreeDblClick = "";
            onTreeExpanded = "";
            onTreeLButtonDown = "";
            onTreeMouseExit = "";
            onTreeSelChanged = QUOTE([ARR_2('TreeSelChanged', _this)] call FUNC(handleInterface));
            shadow = 1;
            show = 1;
            sizeEx = "5 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
            style = 0;
            tooltip = "";
            tooltipColorBox[] = {0,0,0,0};
            tooltipColorShade[] = {0,0,0,1};
            tooltipColorText[] = {1,1,1,1};
            tooltipMaxWidth = 0.5;
            type = 12;

            class ScrollBar {
                width = 0;
                height = 0;
                scrollSpeed = 0.05;
                color[] = {1,1,1,1};
                thumb = "\a3\3DEN\Data\Controls\ctrlDefault\thumb_ca.paa";
                border = "\a3\3DEN\Data\Controls\ctrlDefault\border_ca.paa";
                arrowFull = "\a3\3DEN\Data\Controls\ctrlDefault\arrowFull_ca.paa";
                arrowEmpty = "\a3\3DEN\Data\Controls\ctrlDefault\arrowEmpty_ca.paa";
            };
        };

        class ToggleUnitListButton: GVAR(Button) {
            idc = IDC_UNITLISTBUTTON;
            x = 0.15 * safezoneW + safezoneX;
            y = 0.041 * safezoneH + safezoneY;
            w = 0.03 * safezoneH;
            h = 0.03 * safezoneH;
            colorBorder[] = {1,1,1,1};
            colorBackgroundActive[] = ARCRED;
            colorBackgroundDisabled[] = {0,0,0,0.75};
            colorDisabled[] = {0.4,0.4,0.4,1};
            colorFocused[] = BACKGROUND_COLOR;
            colorShadow[] = {1,1,1,1};
            colorText[] = {1,1,1,1};
            color[] = {1,1,1,1};
            colorBackground[] = BACKGROUND_COLOR;
            text = "«";
            onButtonClick = QUOTE([ARR_2(_this select 0, 6)] call FUNC(handleMenu));
        };

        class RefreshUnitList: GVAR(Button) {
            idc = IDC_UNITLISTREFRESH;
            x = 0 * safezoneW + safezoneX;
            y = 0 * safezoneH + safezoneY;
            w = 0.05 * safezoneW;
            h = 0.03 * safezoneH;
            text = "REFRESH LIST";
            onButtonClick = QUOTE(call FUNC(updateUnitList));
            tooltip = "Refresh the unit list below";
        };

        class TagsNameButton: GVAR(Button) {
            idc = IDC_TAGSNAMEBUTTON;
            x = 0.1 * safezoneW + safezoneX;
            y = 0 * safezoneH + safezoneY;
            w = 0.07 * safezoneW;
            h = 0.03 * safezoneH;
            text = "TAGS (OFF)";
            tooltip = "Filter tags by side/players";
            onButtonClick = QUOTE([ARR_2(_this select 0, 2)] call FUNC(handleMenu));
        };

        class TracersButton: GVAR(Button) {
            idc = IDC_TRACERSBUTTON;
            x = 0.17 * safezoneW + safezoneX;
            y = 0 * safezoneH + safezoneY;
            w = 0.07 * safezoneW;
            h = 0.03 * safezoneH;
            text = "3D TRACERS (OFF)";
            tooltip = "Warning: May cause major lag";
            onButtonClick = QUOTE([ARR_2(_this select 0, 5)] call FUNC(handleMenu));
        };

        class FirstPersonButton: GVAR(Button) {
            idc = IDC_FIRSTPERSONBUTTON;
            x = 0.22 * safezoneW + safezoneX;
            y = 0 * safezoneH + safezoneY;
            w = 0.05 * safezoneW;
            h = 0.03 * safezoneH;
            text = "VIEW (FIRST PERSON)";
            onButtonClick = QUOTE([ARR_2(_this select 0, 3)] call FUNC(handleMenu));
        };

        class RespawnButton: GVAR(Button) {
            idc = IDC_RESPAWNBUTTON;
            x = 0.25 * safezoneW + safezoneX;
            y = 0 * safezoneH + safezoneY;
            w = 0.05 * safezoneW;
            h = 0.03 * safezoneH;
            text = "REJOIN MISSION";
            tooltip = "Rejoin the mission as a new character";
            onButtonClick = QUOTE([ARR_2(_this select 0, 4)] call FUNC(handleMenu));
        };
    };
};
