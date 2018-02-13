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
    "<t size='1.25' color='#f9c600'>Loadout</t>",
    "<t size='0.88' underline='true'>#loadout &lt;role&gt;</t>",
    "<t size='0.66'>Applies the given role loadout to the local player. Roles are the names of loadouts in the player faction's loadout file.",
    "Eg. #loadout aar for assistant automatic rifleman.</t>",
    "",
    "<t size='0.88' underline='true'>#loadout &lt;target_name&gt;</t>",
    "<t size='0.66'>Target name is a name of a connected player and will apply their loadout to the local player.",
    "Eg. #loadout bob</t>",
    "",
    "<t size='0.88' underline='true'>#loadout &lt;target_name&gt; &lt;recipient_name&gt;</t>",
    "<t size='0.66'>Both target name and recipient name are names of connected players. The loadout of target name will be applied to the recipient.",
    "Eg. #loadout bob keith</t>",
    "",
    "<t size='1.25' color='#f9c600'>Radio</t>",
    "<t size='0.88' underline='true'>#radio &lt;type&gt;</t>",
    "<t size='0.66'>Will add the given radio to the local player.",
    "Eg. #radio 343</t>",
    "",
    "<t size='1.25' color='#f9c600'>Reset Position</t>",
    "<t size='0.88' underline='true'>#rp</t>",
    "<t size='0.66'>Will reset the local player's position to the nearest safe position (if you get stuck).</t>",
    "",
    "<t size='1.25' color='#f9c600'>Whisper</t>",
    "<t size='0.88' underline='true'>#whisper &lt;player_name&gt; &lt;message&gt;</t>",
    "<t size='0.66'>Will whisper the given player with the given message. Whisper will show a hint to the recipient and will show who sent the whisper.",
    "Eg. #whisper bob can you teleport me i fell into the sun</t>",
    "",
    "<t size='1.25' color='#f9c600'>Spectator</t>",
    "<t size='0.88' underline='true'>#spec</t>",
    "<t size='0.66'>Will open the spectator interface.</t>",
    "",
    "<t size='1.25' color='#f9c600'>Safe Start</t>",
    "<t size='0.88' underline='true'>#ss &lt;state&gt;</t>",
    "<t size='0.66'>Handles safe start starting/stopping.",
    "State can be either <t size='0.66' underline='true'>on</t> or <t size='0.66' underline='true'>off</t>. Can only be used by logged in admin.",
    "Eg. #ss off</t>",
    "",
    "<t size='1.25' color='#f9c600'>Ending</t>",
    "<t size='0.88' underline='true'>#end &lt;debriefing&gt;</t>",
    "<t size='0.66'>Ends the mission with the given debriefing class.",
    "Debriefing can be one of <t size='0.66' underline='true'>blufor</t>, <t size='0.66' underline='true'>opfor</t>, <t size='0.66' underline='true'>indfor</t>, <t size='0.66' underline='true'>completed</t>, <t size='0.66' underline='true'>failed</t> or <t size='0.66' underline='true'>draw</t>. You can supply just the first character or the full text, eg. #end b or #end blufor.",
    "Can only be used by logged in admin.</t>"
]) joinString "<br />")
