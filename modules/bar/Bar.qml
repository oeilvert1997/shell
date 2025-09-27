pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.config
import "components/battery"
import "components/clock"
import "components/network"
import "components/workspaces"

PanelWindow {
    id: root

    anchors {
        top: true
        left: true
        right: true
    }

    margins {
        top: 8
        left: 16
        right: 16
    }

    implicitHeight: Math.max(
        leftSection.implicitHeight,
        centerSection.implicitHeight,
        rightSection.implicitHeight)

    color: "transparent"

    // Left section
    RowLayout {
        id: leftSection

        anchors {
            top: parent.top
            left: parent.left
        }

        spacing: Appearance.spacing.small

        Clock {}
    }

    // Center section
    RowLayout {
        id: centerSection

        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
        }

        Workspaces {}
    }

    // Right section
    RowLayout {
        id: rightSection

        anchors {
            top: parent.top
            right: parent.right
        }

        spacing: Appearance.spacing.small

        Battery {}

        Network {}
    }
}
