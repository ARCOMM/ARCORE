/*
 * Author: Kingsley
 * Draws the unit tags.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call arcore_spectator_fnc_drawTags;
 *
 * Public: No
 */

#include "script_component.hpp"

if (GVAR(camTagsButton) == 0) exitWith {};
if (!GVAR(camToggleTags)) exitWith {};

private _camera = call FUNC(getCamera);

private _units = switch (GVAR(camTagsButton)) do {
    case 1: {allUnits};
    case 2: {allUnits select {isPlayer _x}};
    case 3: {allUnits select {side group _x == west}};
    case 4: {allUnits select {side group _x == east}};
    case 5: {allUnits select {side group _x == resistance}};
    case 6: {allUnits select {side group _x == civilian}};
};

{
    private _color = [
        GVAR(camColorEmpty),
        GVAR(camColorWest),
        GVAR(camColorEast),
        GVAR(camColorResistance),
        GVAR(camColorCiv)
    ] select (([west, east, resistance, civilian] find (side group _x)) + 1);

    _color set [3, (linearConversion [0, 2000, (_camera distance _x), 1, 0, true])];

    drawIcon3D [
        "\A3\ui_f\data\map\markers\military\dot_CA.paa",
        _color,
        ASLtoAGL ((getPosASLVisual _x) vectorAdd [0, 0, 2]),
        1,
        1,
        0,
        (["", name _x] select (isPlayer _x)),
        2,
        0.03,
        "PuristaBold",
        "center"
    ];

    false
} count (_units select {
    alive _x &&
    {(crew vehicle _x) param [0, _x] == _x}
});
