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
 * [] call arcore_ambient_fnc_preloadCivilians;
 *
 * Public: Yes
 */

 private ["_civilianClassBase", "_civilianClasses"];

 _civilianClassBase = getText (getMissionConfig "CfgARCMF" >> "Ambient" >> "Civilians" >> "classBase");
 _civilianClasses =
     "inheritsFrom _x == (configFile >> 'CfgVehicles' >> '" + _civilianClassBase + "')"
     configClasses
     (configFile >> "CfgVehicles");

{
    _temp = configName _x createvehicle [0,0,1000];
    sleep 0.1;
    deletevehicle _temp;
}
forEach _civilianClasses;

false
