class GVAR(Loadout) {
    displayName = EDEN_TITLE(Loadout);
    collapsed = 0;

    class Attributes {
        class Role {
            displayName = "Role";
            tooltip = "Name of the loadout file for this unit's faction without the extension";
            property = QGVAR(loadout);
            control = "EditShort";
            condition = "objectBrain";
            expression = QUOTE(_this setVariable [ARR_3(QQGVAR(loadout), _value, true)]);
            defaultValue = "nil";
        };
    };
};
