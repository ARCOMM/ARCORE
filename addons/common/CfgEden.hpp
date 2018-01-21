class ctrlCombo;

class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class GVAR(Marker) {
                displayName = EDEN_TITLE(Marker);
                collapsed = 0;

                class Attributes {
                    class Marker {
                        displayName = "Marker";
                        tooltip = "Draws the object on the map.";
                        property = QGVAR(Marker);
                        control = "Checkbox";
                        expression = EDEN_CHECKBOX_IF(_this call FUNC(drawOnMap));
                        defaultValue = 0;
                    };
                };
            };
        };
    };
};
