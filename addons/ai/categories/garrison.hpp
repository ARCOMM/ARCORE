class GVAR(Garrison) {
    displayName = EDEN_TITLE(Garrison);
    collapsed = 0;

    class Attributes {
        class Enabled {
            displayName = "Enabled";
            tooltip = "Garrison all units in this group in nearby buildings.";
            property = QGVAR(GarrisonEnabled);
            control = "Checkbox";
            // expression = QUOTE([ARR_2(_this, _value)] call FUNC(edenGarrison));
            expression = QUOTE(if (_value) then {[ARR_3(leader _this, nil, _this)] call FUNC(garrison)};);
            defaultValue = 0;
            typeName = "BOOL";
        };
    };
};
