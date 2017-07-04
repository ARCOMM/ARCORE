class MARS_Attributes {
    class ADDON {
        #include "attributes\reinforcements.hpp"
        #include "attributes\teleport.hpp"
        #include "attributes\execution.hpp"

        class AdminMenu {
            displayName = "Administration";
            actionConfirm = "";
            actionCancel = "";

            class Gameplay {
                class Exec {
                    displayName = "Execution";
                    tooltipText = "Execute code on the server, global, headless clients or local.";

                    class Button {
                        type = "BUTTON";
                        textPlain = "Open Execution Menu";
                        action = QUOTE([ARR_4(QQADDON, 'Execution', [ARR_2(150, 116)], [ARR_2(0.15, 0.85)])] call AFUNC(openAttributes));
                    };
                };

                class Teleport {
                    displayName = "Teleport";
                    tooltipText = "Teleport a selection of players to a desired location.";

                    class Button {
                        type = "BUTTON";
                        textPlain = "Open Teleport Menu";
                        action = QUOTE([ARR_3(QQADDON, 'Teleport', [ARR_2(100, 100)])] call AFUNC(openAttributes));
                    };
                };

                class Reinforcements {
                    displayName = "Reinforcements";
                    tooltipText = "Send spectating players in as reinforcements.";

                    class Button {
                        type = "BUTTON";
                        textPlain = "Open Reinforcements Menu";
                        action = QUOTE([ARR_3(QQADDON, 'Reinforcements', [ARR_2(100, 100)])] call AFUNC(openAttributes));
                    };
                };
            };
        };
    };

    class MARS_ClientMenu {
        class Interface {
            class Editor {
                class Admin {
                    displayName = "Admin";
                    tooltipText = "Open the admin menu. Only the server admin and verified Steam accounts are able to access the admin menu.";

                    class Button {
                        condition = QUOTE([player] call FUNC(isAdmin));
                        type = "BUTTON";
                        textPlain = "Open Admin Menu";
                        action = QUOTE([] call FUNC(openAdminMenu));
                    };
                };
            };

            class Misc {
                class Debug {
                    displayName = "Debug";
                    tooltipText = "";

                    class ResetPosition {
                        type = "BUTTON";
                        textPlain = "Reset Position";
                        tooltipText = "Reset your position to the nearest safest location. Used for when you get stuck.";
                        action = QUOTE([player] call CFUNC(resetPosition));
                    };
                };
            };
        };
    };
};
