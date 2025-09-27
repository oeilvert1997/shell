import QtQuick
import Quickshell
import Quickshell.Widgets
import qs.components
import qs.components.containers
import qs.services

Item {
    id: root

    anchors {
        top: parent.top
        bottom: parent.bottom
        right: parent.right
    }

    implicitWidth: 420
    // implicitHeight: list.contentHeight
    implicitHeight: list.contentHeight + 300

    ClippingWrapperRectangle {
        anchors.fill: parent

        // color: Qt.rgba(0, 1, 0, 0.2)
        color: "transparent"

        radius: 8

        StyledListView {
            id: list

            model: ScriptModel {
                values: Notifs.popups.filter(n => !n.closed)
            }

            anchors.fill: parent

            orientation: Qt.Vertical
            spacing: 0
            cacheBuffer: QsWindow.window?.screen.height ?? 0

            delegate: Item {
                id: wrapper

                required property Notifs.Notif modelData
                required property int index
                ClippingRectangle {
                    anchors.top: parent.top

                    // color: "blue"
                    color: "transparent"
                    radius: 8
                    // width: parent.width
                    // height: 100
                    implicitWidth: notif.implicitWidth
                    implicitHeight: notif.implicitHeight

                    Notification {
                        id: notif

                        modelData: wrapper.modelData
                    }
                }
            }

        }
    }
}
