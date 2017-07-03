class GVAR(Fireteam) {
    displayName = EDEN_TITLE(Fireteam Markers);
    collapsed = 0;
    class Attributes {
        class Enabled {
            displayName = "Enabled";
            tooltip = "Toggle fireteam markers for this group";
            property = QGVAR(ftEnabled);
            control = "Checkbox";
            expression = QUOTE(_this setVariable [ARR_3(QQGVAR(ftEnabled), _value, true)]);
            defaultValue = 1;
        };
        class Distance {
            displayName = "Distance";
            tooltip = "Maximum distance for the marker to be visible from the player.";
            property = QGVAR(ftDistance);
            control = "EditShort";
            expression = QUOTE(_this setVariable [ARR_3(QQGVAR(ftDistance), _value, true)]);
            defaultValue = 150;
            validate = "number";
            typeName = "NUMBER";
        };
    };
};
