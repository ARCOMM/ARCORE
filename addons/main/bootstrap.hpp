#include "script_component.hpp"

class Header {
    gameType = Coop;
    minPlayers = 1;
    maxPlayers = 229;
    sandbox = 0;
    ARCMF = 1;
};

loadScreen = PATHTOF(data\splash.paa);
enableDebugConsole = 1;
disabledAI = 1;
respawn = 1;
respawnDelay = 3;
respawnButton = 1;
respawnOnStart = -1;
respawnTemplates[] = {"Seagull", "arcore_spectator"};

showGroupIndicator = 0;
showHUD[] = {true, true, false, false, true, true, false, true};
