class GVAR(Garrison) {
    displayName = EDEN_TITLE(Garrison);
    collapsed = 0;

    class Attributes {
        class Enabled {
            displayName = "Enabled";
            tooltip = "Garrison all units in this group in nearby buildings.";
            property = QGVAR(GarrisonEnabled);
            control = "Checkbox";
            expression = QUOTE([ARR_2({(_this select 0) setVariable [ARR_3(QQGVAR(GarrisonEnabled), (_this select 1), true)]}, [ARR_2(_this, _value)])] call CBA_fnc_execNextFrame);
            defaultValue = 0;
        };

        class Radius {
            displayName = "Radius";
            tooltip = "Radius in meters of the garrison range.";
            property = QGVAR(GarrisonRadius);
            control = "EditShort";
            expression = QUOTE([ARR_2({(_this select 0) setVariable [ARR_3(QQGVAR(GarrisonRadius), (_this select 1), true)]}, [ARR_2(_this, _value)])] call CBA_fnc_execNextFrame);
            defaultValue = 250;
            validate = "number";
            typeName = "NUMBER";
        };
    };
};
