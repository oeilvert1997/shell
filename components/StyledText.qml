pragma ComponentBehavior: Bound

import QtQuick

Text {
    id: root

    property bool animate: false
    property string animateProp: "scale"
    property real animateFrom: 0
    property real animateTo: 1
    property int animateDuration: 400  // qs.config.Appearance.anim.durations.normal

    renderType: Text.NativeRendering
    textFormat: Text.PlainText
    // color:
    // font.family:
    // font.pointSize:

    Behavior on text {
        enabled: root.animate

        SequentialAnimation {
            Anim {
                to: root.animateFrom
                easing.bezierCurve: [0.3, 0, 1, 1, 1, 1]
            }
            PropertyAction {}
            Anim {
                to: root.animateTo
                easing.bezierCurve: [0, 0, 0, 1, 1, 1]
            }
        }
    }

    component Anim: NumberAnimation {
        target: root
        property: root.animateProp
        duration: root.animateDuration / 2
        easing.type: Easing.BezierSpline
    }
}
