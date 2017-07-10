class Loadout {
    displayName = "Loadout";
    actionConfirm = QUOTE(_this call FUNC(handleAttributeLoadout));

    class Main {
        class Faction {
            displayName = "Faction";
            tooltipText = "Select the loadout faction.";

            class Control {
                type = "COMBO";
                values[] = {"BLUFOR", "OPFOR", "INDFOR", "CIVILIAN"};
                labels[] = {"BLUFOR", "OPFOR", "INDFOR", "CIVILIAN"};
            };
        };

        class Role {
            displayName = "Role";
            tooltipText = "Enter the role name of the loadout.";

            class Control {
                type = "EDIT";
                textPlain = "R";
            };
        };
    };
};
