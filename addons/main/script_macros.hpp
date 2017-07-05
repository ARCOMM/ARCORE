#include "\z\ace\addons\main\script_macros.hpp"

#define CFUNC(ARG0) EFUNC(common,ARG0)
#define QCFUNC(ARG0) QUOTE(CFUNC(ARG0))

#define EXIT_IF_NOT_ARCMF if !(call CFUNC(addonActive)) exitWith {}

#define EDEN_TITLE(STR) QUOTE(STR)
#define EDEN_CHECKBOX_IF(ARG0) QUOTE(if (_value) then {(ARG0)};)

#define QADDON QUOTE(ADDON)
#define QQADDON QUOTE(QADDON)

#define MFUNC(ARG0,ARG1) TRIPLES(mars,DOUBLES(ARG0,fnc),ARG1)
#define AFUNC(ARG0) MFUNC(attributes,ARG0)

#define SANDBOX_MODE EGVAR(sandbox,enabled)
