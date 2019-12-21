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
