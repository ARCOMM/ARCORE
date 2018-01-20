class Mars_Attributes {
    class ADDON {
        class Interface {
            displayName = "ARCOMM";
            actionConfirm = "";
            actionCancel = "";
            class Terrain {
                class Detail {
                    displayName = "Terrain Detail";
                    tooltipText = "Terrain detail affects the quality of the ground and how far grass is rendered. Lower quality means less vertices are used for terrain rendering, making distant hills less smooth.";
                    class Options {
                        condition = "(true)";
                        type = "COMBO";
                        labels[] = {"Low", "Medium", "High", "Very High"};
                        values[] = {25, 12.5, 6.25, 3.125};
                        selected = QGVAR(terrainDetail);
                        expression = QUOTE(\
                            _value = parseNumber (_this select 1);\
                            [_value] call FUNC(setTerrainDetail);\
                        );
                    };
                };
                class Distance {
                    displayName = "View Distance";
                    tooltipText = "View distance affects how far you can see. Note that this does not affect object view distance (you can change that in your Arma 3 settings).";
                    class Options {
                        condition = "(true)";
                        type = "SLIDER";
                        range[] = {500, 10000};
                        step = 500;
                        position = QGVAR(viewDistance);
                        expression = QUOTE(\
                            [_this] call FUNC(setViewDistance);\
                        );
                        onSliderPosChanged = QUOTE(\
                            _ctrl = _this select 0;\
                            _value = round (sliderPosition _ctrl);\
                            _ctrl ctrlSetTooltip format [ARR_2('%1m', _value)];\
                        );
                    };
                };
            };
            class Editor {
                class Zeus1 {
                    displayName = "Zeus 1";
                    tooltipText = "Login to Zeus to start editing the current running mission.";
                    class Label {
                        condition = "(true)";
                        type = "LABEL";
                        width = 0.66;
                        textCode = QUOTE(\
                            if (!isNil QUOTE(QEFUNC(zeus,getCuratorString))) then {\
                                ([1] call EFUNC(zeus,getCuratorString))\
                            } else {\
                                'Undefined'\
                            };\
                        );
                    };
                    class Button {
                        condition = QUOTE(\
                            if (!isNil QUOTE(QEFUNC(zeus,isAvailable))) then {\
                                ([1] call EFUNC(zeus,isAvailable))\
                            } else {\
                                false\
                            };\
                        );
                        type = "BUTTON";
                        width = 0.33;
                        textCode = QUOTE(\
                            if (!isNil QUOTE(QEFUNC(zeus,getCuratorBtnString))) then {\
                                ([1] call EFUNC(zeus,getCuratorBtnString))\
                            } else {\
                                'Disabled'\
                            };\
                        );
                        action = QUOTE([1] call EFUNC(zeus,openZeus));
                    };
                };
                class Zeus2 {
                    displayName = "Zeus 2";
                    tooltipText = "Login to Zeus to start editing the current running mission.";
                    class Label {
                        condition = "(true)";
                        type = "LABEL";
                        width = 0.66;
                        textCode = QUOTE(\
                            if (!isNil QUOTE(QEFUNC(zeus,getCuratorString))) then {\
                                ([2] call EFUNC(zeus,getCuratorString))\
                            } else {\
                                'Undefined'\
                            };\
                        );
                    };
                    class Button {
                        condition = QUOTE(\
                            if (!isNil QUOTE(QEFUNC(zeus,isAvailable))) then {\
                                ([2] call EFUNC(zeus,isAvailable))\
                            } else {\
                                false\
                            };\
                        );
                        type = "BUTTON";
                        width = 0.33;
                        textCode = QUOTE(\
                            if (!isNil QUOTE(QEFUNC(zeus,getCuratorBtnString))) then {\
                                ([2] call EFUNC(zeus,getCuratorBtnString))\
                            } else {\
                                'Disabled'\
                            };\
                        );
                        action = QUOTE([2] call EFUNC(zeus,openZeus));
                    };
                };
            };
        };
    };
};
