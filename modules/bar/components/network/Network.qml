pragma ComponentBehavior: Bound

import QtQuick
import Quickshell.Services.UPower
import qs.components
import qs.config

Rectangle {
    id: root

    implicitHeight: batteryRow.implicitHeight + 8
    implicitWidth: batteryRow.implicitWidth + 24
    color: "#1e1e2e"
    radius: Appearance.rounding.normal

    Row {
        id: batteryRow

        anchors.centerIn: parent
        spacing: 0

        // 󰛳 nf-md-network
        BatteryText {
            text: "󰤨   Nautilus"
        }
    }

    component BatteryText: Text {
        font.family: "JetBrainMono Nerd Font Propo"
        font.pixelSize: 16
        color: "#ffffff"
        anchors.verticalCenter: parent.verticalCenter
    }
}
