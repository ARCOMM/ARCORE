class GVAR(Roster) {
    displayName = EDEN_TITLE(Element Details);
    collapsed = 0;

    class Attributes {
        class Enabled {
            displayName = "Enabled";
            tooltip = "Show this group in the platoon roster.";
            property = QGVAR(rosterEnabled);
            control = "Checkbox";
            expression = QUOTE([ARR_2({(_this select 0) setVariable [ARR_3(QQGVAR(rosterEnabled), (_this select 1), true)]}, [ARR_2(_this, _value)])] call CBA_fnc_execNextFrame);
            defaultValue = 0;
        };

        class ElementName {
            displayName = "Name";
            tooltip = "Name of this group's element, eg. Alpha, Bravo, 1st Platoon.";
            property = QGVAR(ElementName);
            control = "Edit";
            expression = QUOTE([ARR_2({(_this select 0) setVariable [ARR_3(QQGVAR(ElementName), (_this select 1), true)]}, [ARR_2(_this, _value)])] call CBA_fnc_execNextFrame);
            defaultValue = "nil";
        };

        class RosterOrder {
            displayName = "Order";
            tooltip = "Order of the element in the platoon roster.";
            property = QGVAR(RosterOrder);
            control = "EditShort";
            expression = QUOTE([ARR_2({(_this select 0) setVariable [ARR_3(QQGVAR(RosterOrder), (_this select 1), true)]}, [ARR_2(_this, _value)])] call CBA_fnc_execNextFrame);
            defaultValue = "100";
            validate = "number";
            typeName = "NUMBER";
        };
    };
};
