/*
 * Author: Kingsley
 * Gets the text to display in the control.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Text <STRING>
 *
 * Example:
 * [] call arcore_common_fnc_getChatCommandReferenceText;
 *
 * Public: No
 */

#include "script_component.hpp"

parseText (([
    "<t size='1' color='#f9c600'>Loadout - #loadout (role)</t>",
    "<t size='1' color='#f9c600'>Loadout - #loadout (from player)</t>",
    "<t size='1' color='#f9c600'>Loadout - #loadout (from player) (to player)</t>",
    "<t size='0.88'>#loadout ar</t>",
    "<t size='0.88'>#loadout Bizo</t>",
    "<t size='0.88'>#loadout Bizo Perpetual</t>",
    "",
    "<t size='1' color='#f9c600'>Heal - #heal</t>",
    "<t size='1' color='#f9c600'>Heal - #heal (player)</t>",
    "<t size='0.88'>#heal</t>",
    "<t size='0.88'>#heal Bizo</t>",
    "",
    "<t size='1' color='#f9c600'>Reset Position - #rp</t>",
    "<t size='0.88'>#rp</t>",
    "",
    "<t size='1' color='#f9c600'>Teleport - #tp (player|group)</t>",
    "<t size='0.88'>#tp Bizo</t>",
    "<t size='0.88'>#tp a1</t>",
    "",
    "<t size='1' color='#f9c600'>Group Name - #groupname (name)</t>",
    "<t size='0.88'>#groupname UGLY1</t>",
    "",
    "<t size='1' color='#f9c600'>Group Color - #groupcolor (color)</t>",
    "<t size='0.88'>#groupcolor red</t>",
    "",
    "<t size='1' color='#f9c600'>Whisper - #whisper (player) (message)</t>",
    "<t size='0.88'>#whisper Bizo hello how you doing please help me</t>",
    "",
    "<t size='1' color='#f9c600'>Spectator - #spec</t>",
    "<t size='0.88'>#spec</t>",
    "",
    "<t size='1' color='#f9c600'>Attack/Defend - #ad (attackers) (defenders) (attackers diameter) (defenders diameter)</t>",
    "<t size='0.88'>#ad blu opf 750 150</t>",
    "",
    "<t size='1' color='#f9c600'>Stage - #stage</t>",
    "<t size='0.88'>#stage</t>",
    "",
    "<t size='1' color='#f9c600'>Safe Start - #ss (on|off)</t>",
    "<t size='0.88'>#ss on</t>",
    "<t size='0.88'>#ss off</t>",
    "",
    "<t size='1' color='#f9c600'>Ending - #end (blufor, opfor, indfor, completed, failed, draw)</t>",
    "<t size='0.88'>#end b</t>",
    "<t size='0.88'>#end opfor</t>",
    "<t size='0.88'>#end ind</t>"
]) joinString "<br />")
