#include "\z\ace\addons\main\script_macros.hpp"

#define CFUNC(ARG0) EFUNC(common,ARG0)
#define QCFUNC(ARG0) QUOTE(CFUNC(ARG0))

#define EXIT_IF_NOT_ARCMF if !([] call CFUNC(addonActive)) exitWith {}
#define EXIT_IF_NOT_VULCAN EXIT_IF_NOT_ARCMF

#define EDEN_TITLE(STR) ARCORE_TAG## ##STR
