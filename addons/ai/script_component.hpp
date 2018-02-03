#define COMPONENT ai
#define COMPONENT_BEAUTIFIED AI
#include "\z\arcore\addons\main\script_mod.hpp"

#define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_AI
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_AI
    #define DEBUG_SETTINGS DEBUG_SETTINGS_AI
#endif

#include "\z\arcore\addons\main\script_macros.hpp"

#define DEBUG_TAG(ARG0) (_this setVariable [QGVAR(debugText), ARG0])
#define TIMER_SET(ARG0) (_this setVariable [QGVAR(ARG0), time])
#define TIMER_GET(ARG0) (time - (_this getVariable [QGVAR(ARG0), 0]))
#define TIMER_RESET(ARG0) (_this setVariable [QGVAR(ARG0), 0])
