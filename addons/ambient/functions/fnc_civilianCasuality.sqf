/*
 * Author: Jay
 * Do something when civilian is hurt or killed
 *
 * Arguments:
 * _unit - unit being shot
 * _shooter - unit shooting
 *
 * Return Value:
 * none
 *
 * Example:
 * [] call arcore_ambient_fnc_civilianCasuality;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_unit", "_shooter"];

if (side player == side _shooter) then
{
    hint "DO NOT engage civilians!";
};
