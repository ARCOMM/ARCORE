/*
 * Author: Jay
 * Finds a random position in a random building,
 *  given an area and (optional) minimum building size.
 *
 * Arguments:
 * 0: Area middle <ARRAY>
 * 1: Area radius <NUMBER>
 * 2: Minimum building size <NUMBER>
 *
 * Return Value:
 * Building position <ARRAY>
 *
 * Example:
 * [position player, 100, 2] call arcore_ambient_fnc_getRandomBuildingPos;
 *
 * Public: Yes
 */

params ["_position", "_radius", ["_buildingSizeMin", 1]];
private ["_building", "_buildings", "_tryBuilding", "_positions"];

_building = objNull;
_buildings = _position nearObjects ["house", _radius];
_positions = [[0,0,0]];

while {isNull _building && count _buildings > 0} do
{
    _tryBuilding = selectRandom _buildings;
    _positions = _tryBuilding buildingPos -1;

    if (count _positions >= _buildingSizeMin) then
    {
        _building = _tryBuilding;
    };

    _buildings = _buildings - [_tryBuilding];
};

selectRandom _positions
