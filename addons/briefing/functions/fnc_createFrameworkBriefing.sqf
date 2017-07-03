/*
 * Author: Kingsley
 * Creates the framework briefing
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call arcore_briefing_fnc_createFrameworkBriefing;
 *
 * Public: No
 */

#include "script_component.hpp"

player createDiarySubject ["ARCMF", "ARCMF"];

//--- TODO
// Gear
// Groups
// Spectator

//--- Missing Radios
player createDiaryRecord ["ARCMF", [
    "Radios",
    "\
<br/>
<font size='15' face='PuristaBold'>MISSING RADIOS</font><br/>\
<font size='14'>Do not abuse these functions. They are only to be used if you are missing a radio and it's not by mission design.</font><br/>\
<font size='14'><execute expression=""[player, 'ACRE_PRC343'] call " + QCFUNC(addRadio) + """>Add AN/PRC-343</execute></font><br/>\
<font size='14'><execute expression=""[player, 'ACRE_PRC148'] call " + QCFUNC(addRadio) + """>Add AN/PRC-148</execute></font><br/>\
<font size='14'><execute expression=""[player, 'ACRE_PRC152'] call " + QCFUNC(addRadio) + """>Add AN/PRC-152</execute></font><br/>\
<font size='14'><execute expression=""[player, 'ACRE_PRC117F'] call " + QCFUNC(addRadio) + """>Add AN/PRC-117F</execute></font><br/>\
<font size='14'><execute expression=""[player, 'ACRE_PRC77'] call " + QCFUNC(addRadio) + """>Add AN/PRC-77</execute></font><br/>\
    "
]];

player createDiaryRecord ["ARCMF", ["Version", format ["<br/><font size='15' face='PuristaBold'>%1</font>", QUOTE(VERSION)]]];
