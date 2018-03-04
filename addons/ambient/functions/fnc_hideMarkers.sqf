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

{
    if (_x find "ARCORE_ambient_civilians_" == 0) then
    {
        _x setMarkerAlphaLocal 0;
    };
}
forEach allMapMarkers;

false
