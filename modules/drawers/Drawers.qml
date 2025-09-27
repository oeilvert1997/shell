pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Wayland

Variants {
    model: Quickshell.screens

    Scope {
        id: scope

        required property ShellScreen modelData

        // Exclusions {
        //     screen: scope.modelData
        //     bar: bar
        // }

        PanelWindow {
            id: win

            screen: scope.modelData

            anchors {
                top: true
                bottom: true
                left: true
                right: true
            }

            WlrLayershell.exclusionMode: ExclusionMode.Ignore
            WlrLayershell.keyboardFocus: WlrKeyboardFocus.None

            implicitWidth: 420
            implicitHeight: 1080
            // color: Qt.rgba(0, 0, 1, 0.5)
            color: "transparent"

            mask: Region {
                x: 0
                y: 0
                width: win.width
                height: win.height
                intersection: Intersection.Xor

                regions: [
                    Region {
                        x: win.width - (panels.notifications?.implicitWidth ?? 0)
                        y: 0
                        width: panels.notifications?.implicitWidth ?? 0
                        height: panels.notifications?.implicitHeight ?? 0
                    }
                ]
            }

            Panels {
                id: panels
                anchors.fill: parent
            }

        }
    }
}
