import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import qs.components

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

  Layout.alignment: Qt.AlignVCenter
  Layout.preferredWidth: size

  spacing: 0

  StyledText {
    id: indicator

    Layout.alignment: Qt.AlignCenter
    Layout.preferredWidth: 32

    font.pixelSize: 18
    font.bold: true

    animate: true

    // 󰄰 nf-md-checkbox_blank_circle_outline
    // 󰄯 nf-md-checkbox_balnk_circle
    // 󰐾 nf-md-radiobox-marked
    // 󰀚 nf-md-adjust
    // 󰧞 nf-md-circle-medium
    text: "󰧞"

    color: "white"
    verticalAlignment: Qt.AlignVCenter
    horizontalAlignment: Qt.AlignHCenter

    MouseArea {
      anchors.fill: parent
      cursorShape: Qt.PointingHandCursor
      onClicked: Hyprland.dispatch(`workspace ${root.ws}`)
    }
  }
}
