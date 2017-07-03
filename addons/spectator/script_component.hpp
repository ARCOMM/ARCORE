#define COMPONENT spectator
#define COMPONENT_BEAUTIFIED Spectator
#include "\z\arcore\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_SPECTATOR
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_SPECTATOR
    #define DEBUG_SETTINGS DEBUG_SETTINGS_SPECTATOR
#endif

#include "\z\arcore\addons\main\script_macros.hpp"

#include "UI\resinc.hpp"

#define BACKGROUND_COLOR {0,0,0,1}
#define PRIMARYCOLOR {1,1,1,1}
#define ARCRED {0.741,0.173,0.173,1}
