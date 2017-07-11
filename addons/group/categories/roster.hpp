class GVAR(Roster) {
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

        class RosterOrder {
            displayName = "Order";
            tooltip = "Order of the element in the platoon roster.";
            property = QGVAR(RosterOrder);
            control = "EditShort";
            expression = QUOTE(_this setVariable [ARR_3(QQGVAR(RosterOrder), _value, true)]);
            defaultValue = "100";
            validate = "number";
            typeName = "NUMBER";
        };
    };
};
