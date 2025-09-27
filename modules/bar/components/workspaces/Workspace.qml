pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import qs.components
import qs.services

RowLayout {
    id: root

    required property int index
    required property int activeWsId
    required property var occupied
    required property int groupOffset

    readonly property bool isWorkspace: true
    readonly property int size: implicitWidth

    readonly property int ws: groupOffset + index + 1
    readonly property bool isOccupied: occupied[ws] ?? false
    readonly property bool isActive: ws === activeWsId

    Layout.alignment: Qt.AlignVCenter
    Layout.preferredWidth: size

    spacing: 0

    StyledText {
        id: indicator

        Layout.alignment: Qt.AlignCenter
        Layout.preferredWidth: 32

        font.pixelSize: isActive ? 16 : 16
        // font.bold: isActive

        animate: true

        // 󰄰 nf-md-checkbox_blank_circle_outline
        // 󰄯 nf-md-checkbox_balnk_circle
        // 󰐾 nf-md-radiobox-marked
        // 󰀚 nf-md-adjust
        // 󰧞 nf-md-circle-medium
        text: isActive ? "󰐾" : (isOccupied ? "󰄯" : "󰧞")

        color: isActive ? "#ffffff" : (isOccupied ? "#ffffff" : "#ffffff")

        verticalAlignment: Qt.AlignVCenter
        horizontalAlignment: Qt.AlignHCenter

        // Behavior on font.pixelSize {
        //   NumberAnimation { duration: 150; easing.type: Easing.OutCubic }
        // }

        // Behavior on color {
        //   ColorAnimation { duration: 150 }
        // }

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                if (!root.isActive) {
                    Hypr.dispatch(`workspace ${root.ws}`)
                }
            }
        }
    }
}
