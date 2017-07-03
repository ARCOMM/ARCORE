class GVAR(Group) {
    displayName = EDEN_TITLE(Group Marker);
    collapsed = 0;
    class Attributes {
        class Enabled {
            displayName = "Enabled";
            tooltip = "Toggle group markers for this group";
            property = QGVAR(enabled);
            control = "Checkbox";
            expression = QUOTE(_this setVariable [ARR_3(QQGVAR(enabled), _value, true)]);
            defaultValue = 0;
        };
        class Delay {
            displayName = "Delay";
            tooltip = "Delay in seconds for this group's marker update";
            property = QGVAR(delay);
            control = "EditShort";
            expression = QUOTE(_this setVariable [ARR_3(QQGVAR(delay), _value, true)]);
            defaultValue = DEFAULT_DELAY;
            validate = "number";
            typeName = "NUMBER";
        };
        class Accuracy {
            displayName = "Accuracy";
            tooltip = "Accuracy of this group's marker position in meters";
            property = QGVAR(accuracy);
            control = "EditShort";
            expression = QUOTE(_this setVariable [ARR_3(QQGVAR(accuracy), _value, true)]);
            defaultValue = 0;
            validate = "number";
            typeName = "NUMBER";
        };
        class Text {
            displayName = "Text";
            tooltip = "Text shown on this group's marker";
            property = QGVAR(text);
            control = "Edit";
            expression = QUOTE(_this setVariable [ARR_3(QQGVAR(text), _value, true)]);
            defaultValue = "groupId _this";
        };
        class Color {
            displayName = "Color";
            tooltip = "Color of this group's marker";
            property = QGVAR(color);
            control = "MarkerColor";
            expression = QUOTE(_this setVariable [ARR_3(QQGVAR(color), _value, true)]);
            defaultValue = 0;
        };
        class Code {
            displayName = "Code";
            tooltip = "Apply code to this group's marker. Passed marker is stored in _this. Always use the local variant of the marker commands.";
            property = QGVAR(code);
            control = "EditCodeMulti5";
            expression = QUOTE(_this setVariable [ARR_3(QQGVAR(code), _value, true)]);
            defaultValue = "nil";
        };
    };
};
