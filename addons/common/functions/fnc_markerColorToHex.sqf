/*
 * Author: Kingsley
 * Converts a marker classname to a hex color
 *
 * Arguments:
 * 0: Marker classname <STRING>
 *
 * Return Value:
 * Hex color <STRING>
 *
 * Example:
 * ["ColorWhite"] call arcore_common_fnc_markerColorToHex;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_colorClassname", "", [""]]];

private _colorRGBA = (configfile >> "CfgMarkerColors" >> _colorClassname >> "color") call BIS_fnc_colorConfigToRGBA;
private _colorHEX = _colorRGBA call BIS_fnc_colorRGBAtoHTML;

_colorHEX
