#define COMPONENT acre
#define COMPONENT_BEAUTIFIED ACRE
#include "\z\arcore\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_ACRE
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_ACRE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_ACRE
#endif

#include "\z\arcore\addons\main\script_macros.hpp"

#define ACRE_LOSSMODELSCALE 0.5
#define ACRE_FULLDUPLEX true
#define ACRE_REVEALTOAI true
#define ACRE_INTERFERENCE true
#define ACRE_IGNOREANTENNADIRECTION true
