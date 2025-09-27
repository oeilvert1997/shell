pragma ComponentBehavior: Bound

import QtQuick

Rectangle {
  id: root

  implicitHeight: clockRow.implicitHeight + 8
  implicitWidth: clockRow.implicitWidth + 24
  color: "#1e1e2e"
  radius: 16

  Row {
    id: clockRow

    anchors.centerIn: parent
    spacing: 0

    ClockText {
      text: "󰥔"
      rightPadding: 8
    }
    Hour { anchors.verticalCenter: parent.verticalCenter }
    ClockText { text: ":" }
    Minute { anchors.verticalCenter: parent.verticalCenter }
  }

  component ClockText: Text {
    font.family: "JetBrainsMono Nerd Font Propo"
    font.pixelSize: 16
    font.bold: true
    color: "#ffffff"
    anchors.verticalCenter: parent.verticalCenter
  }
}
