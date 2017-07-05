class GVAR(Garrison) {
    displayName = EDEN_TITLE(Garrison);
    collapsed = 0;

    class Attributes {
        class Enabled {
            displayName = "Enabled";
            tooltip = "Garrison all units in this group in nearby buildings.";
            property = QGVAR(GarrisonEnabled);
            control = "Checkbox";
            expression = EDEN_CHECKBOX_IF([ARR_3(leader _this, nil, _this)] call FUNC(garrison));
            defaultValue = 0;
        };
    };
};
