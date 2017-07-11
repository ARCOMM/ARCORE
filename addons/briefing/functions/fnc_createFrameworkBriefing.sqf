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

private _isAdmin = [player] call EFUNC(admin,isAdmin);

player createDiarySubject ["ARCMF", "ARCMF"];

//--- Missing Radios
player createDiaryRecord ["ARCMF", [
    "Radios",
    "\
<br/>
<font size='15' face='PuristaBold'>MISSING RADIOS</font><br/>\
<font size='14'>Do not abuse these functions. They are only to be used if you are missing a radio and it's not by mission design.</font><br/>\
<font size='14'><execute expression=""[player, 'ACRE_PRC343'] call " + QEFUNC(acre,addRadio) + """>Add AN/PRC-343</execute></font><br/>\
<font size='14'><execute expression=""[player, 'ACRE_PRC148'] call " + QEFUNC(acre,addRadio) + """>Add AN/PRC-148</execute></font><br/>\
<font size='14'><execute expression=""[player, 'ACRE_PRC152'] call " + QEFUNC(acre,addRadio) + """>Add AN/PRC-152</execute></font><br/>\
<font size='14'><execute expression=""[player, 'ACRE_PRC117F'] call " + QEFUNC(acre,addRadio) + """>Add AN/PRC-117F</execute></font><br/>\
<font size='14'><execute expression=""[player, 'ACRE_PRC77'] call " + QEFUNC(acre,addRadio) + """>Add AN/PRC-77</execute></font><br/>\
    "
]];

//--- Admin
if (_isAdmin) then {
    player createDiaryRecord ["ARCMF", [
        "Admin",
        "\
<br/>
<font size='15' face='PuristaBold'>Briefing Stage</font><br/>\
<font size='14'><execute expression=""[0] remoteExecCall ['" + QFUNC(startBriefingStage) + "', 2]"">Start</execute></font> | \
<font size='14'><execute expression=""[] remoteExecCall ['" + QFUNC(endBriefingStage) + "', 2]"">Stop</execute></font><br/>\
<br/><br/>\
<font size='15' face='PuristaBold'>Loadout</font><br/>\
<font size='14'><execute expression=""openMap false; ['arcore_loadout', 'Loadout', [75, 50]] call " + QAFUNC(openAttributes) + """>Open Loadout Dialog</execute></font>\
        "
    ]];
};

player createDiaryRecord ["ARCMF", ["Version", format ["<br/><font size='15' face='PuristaBold'>%1</font>", QUOTE(VERSION)]]];
