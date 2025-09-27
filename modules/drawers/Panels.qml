import QtQuick
import qs.modules.notifications as Notifications

Item {
    id: root

    anchors.fill: parent

    readonly property alias notifications: notifications

    Notifications.Wrapper {
        id: notifications

        // visibilities: root.visibilities
        // panels: root

        anchors.top: parent.top
        anchors.right: parent.right
    }
}
