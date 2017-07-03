class Cfg3DEN {
    class Group {
        class AttributeCategories {
            class GVAR(Group) {
                displayName = EDEN_TITLE(Element Details);
                collapsed = 0;
                class Attributes {
                    class ElementName {
                        displayName = "Name";
                        tooltip = "Name of this group's element, eg. Alpha, Bravo, 1st Platoon.";
                        property = QGVAR(ElementName);
                        control = "Edit";
                        expression = QUOTE(_this setVariable [ARR_3(QQGVAR(ElementName), _value, true)]);
                        defaultValue = "nil";
                    };
                };
            };
        };
    };
};
