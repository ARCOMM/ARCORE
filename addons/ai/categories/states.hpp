class GVAR(States) {
    displayName = EDEN_TITLE(States);
    collapsed = 0;

    class Attributes {
        class DisablePath {
            displayName = "Disable Path";
            tooltip = "Disables the unit's path; stopping them from moving, but allowing them to aim.";
            property = QGVAR(StateDisablePath);
            control = "Checkbox";
            expression = EDEN_CHECKBOX_IF(_this disableAI 'PATH');
            defaultValue = 0;
        };
    };
};
