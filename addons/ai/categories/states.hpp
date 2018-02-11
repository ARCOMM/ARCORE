class GVAR(States) {
    displayName = EDEN_TITLE(States);
    collapsed = 0;

    class Attributes {
        class DisablePath {
            displayName = "Disable Path";
            tooltip = "Disables the unit's path; stopping them from moving, but allowing them to aim.";
            property = QGVAR(StateDisablePath);
            control = "Checkbox";
            expression = QUOTE(if (!_value) exitWith {}; [ARR_2({(_this select 0) disableAI 'PATH'; [ARR_2((_this select 0), {_this disableAI 'PATH'})] call FUNC(pushLocalCommand);}, [ARR_2(_this, _value)])] call CBA_fnc_execNextFrame);
            defaultValue = 0;
        };

        class DisableGear {
            displayName = "Disable AI Gear";
            tooltip = "Disables the unit's AI gear. You can now edit this unit's loadout via the Eden editor arsenal.";
            property = QGVAR(StateDisableGear);
            control = "Checkbox";
            expression = QUOTE([ARR_2({(_this select 0) setVariable [ARR_3(QQGVAR(blacklistGear), (_this select 1), true)]}, [ARR_2(_this, _value)])] call CBA_fnc_execNextFrame);
            defaultValue = 0;
        };
    };
};
