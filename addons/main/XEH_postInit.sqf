#include "script_component.hpp"

// Register Chat Commands
{_x call FUNC(registerChatCommand)} forEach [
    ["groupname", "all"],
    ["groupcolor", "all"],
    ["radio", "all"],
    ["loadout", "all"],
    ["rp", "all"],
    ["heal", "all"],
    ["whisper", "all"],
    ["spec", "all"]
];
