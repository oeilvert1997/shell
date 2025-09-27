pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell
import "components/clock"
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

  color: "transparent"

  implicitHeight: 32

  Rectangle {
    id: barBackground
    anchors.fill: parent
    color: "transparent"
  }

  RowLayout {
    anchors.fill: parent

    // LEFT SECTION ////////////////////////////
    RowLayout {
      id: leftSection
      Layout.fillHeight: true
      Layout.preferredWidth: (parent.width - centerSection.implicitWidth) / 2

      // Clock
      Clock {
        id: clockWidget
      }
    }

    // CENTER SECTION //////////////////////////
    RowLayout {
      id: centerSection
      Layout.fillHeight: true
      Layout.alignment: Qt.AlignCenter

      // Workspaces
      Workspaces {
        id: workspacesWidget
      }
    }

    // RIGHT SECTION ///////////////////////////
    RowLayout {
      id: rightSection
      Layout.fillHeight: true
      Layout.preferredWidth: (parent.width - centerSection.implicitWidth) / 2

      // Spacer - pushes elements to the right
      Item { Layout.fillWidth: true }
    }
  }
}
