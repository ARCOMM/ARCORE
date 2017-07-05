/*
 * Author: Kingsley
 * Shuffles the given array.
 *
 * Arguments:
 * 0: Array <ARRAY>
 *
 * Return Value:
 * Array <ARRAY>
 *
 * Example:
 * [[1,2,3]] call arcore_common_fnc_arrayShuffle;
 *
 * Public: Yes
 */

#include "script_component.hpp"

private _count = count _this;

for "_i" from 1 to _count do {
    _this pushBack (_this deleteAt floor random _count);
};

_this
