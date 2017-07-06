class GVAR(Garrison) {
    displayName = EDEN_TITLE(Garrison);
    collapsed = 0;

    class Attributes {
        class Enabled {
            displayName = "Enabled";
            tooltip = "Garrison all units in this group in nearby buildings.";
            property = QGVAR(GarrisonEnabled);
            control = "Checkbox";
            expression = QUOTE(_this setVariable [ARR_3(QQGVAR(GarrisonEnabled), _value, true)]);
            defaultValue = 0;
        };

        class Radius {
            displayName = "Radius";
            tooltip = "Radius in meters of the garrison range.";
            property = QGVAR(GarrisonRadius);
            control = "EditShort";
            expression = QUOTE(_this setVariable [ARR_3(QQGVAR(GarrisonRadius), _value, true)]);
            defaultValue = 250;
            validate = "number";
            typeName = "NUMBER";
        };
    };
};
