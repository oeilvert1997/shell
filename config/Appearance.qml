pragma Singleton

import QtQml

QtObject {

    // Shell
    // readonly property Bar bar: Bar {}

    // Design tokens
    readonly property Rounding rounding: Rounding {}
    readonly property Spacing spacing: Spacing {}
    readonly property Padding padding: Padding {}
    readonly property FontStuff font: FontStuff {}
    readonly property Anim anim: Anim {}
    readonly property Transparency transparency: Transparency {}

    // Shell
    // component Bar : QtObject {
    //     readonly property int rounding: rounding.normal
    // }

    // Design tokens
    component Rounding : QtObject {
        property real scale: 1
        readonly property int small: Math.round(8 * scale)
        readonly property int normal: Math.round(16 * scale)
        readonly property int large: Math.round(24 * scale)
        readonly property int full: Math.round(1000 * scale)
    }

    component Spacing : QtObject {
        property real scale: 1
        readonly property int small: Math.round(8 * scale)
        readonly property int normal: Math.round(16 * scale)
        readonly property int large: Math.round(24 * scale)
    }

    component Padding : QtObject {
    }

    component FontStuff : QtObject {
    }

    component Anim : QtObject {
    }

    component Transparency : QtObject {
    }
}
