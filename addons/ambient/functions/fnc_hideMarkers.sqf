/*
 * Author: Jay
 *
 * Arguments:
 * none
 *
 * Return Value:
 * false
 *
 * Example:
 * [] call arcore_ambient_fnc_hideMarkers;
 *
 * Public: Yes
 */

private ["_shouldHide"];

{
    if ("alice_area_" == [_x, 0, 10] call BIS_fnc_trimString) then
    {
        _x setMarkerAlphaLocal 0;
    }
}
forEach allMapMarkers;

false
