import QtQuick
import Quickshell.Hyprland

Row {
  id: root
  property int workspaceCount: 5
  property int activeWorkspaceId: Hyprland.focusedWorkspace?.id ?? 1
  property var occupied: ({})

  function updateOccupied() {
    let occ = {};
    let toplevels = Hyprland.toplevels.values;
    for (let i = 0; i < toplevels.length; i++) {
      let toplevel = toplevels[i];
      if (toplevel && toplevel.workspace) {
        occ[toplevel.workspace.id] = true;
      }
    }
    root.occupied = occ;
  }

  Component.onCompleted: updateOccupied()

  Rectangle {
    implicitHeight: 30
    implicitWidth: workspaceRow.implicitWidth + 32
    color: "#1e1e2e"
    radius: 16

    Row {
      id: workspaceRow
      anchors.centerIn: parent
      spacing: 8

      Repeater {
        model: root.workspaceCount

        Rectangle {
          id: workspaceIndicator
          property int workspaceId: index + 1
          property bool isActive: root.activeWorkspaceId === workspaceId
          property bool hasWindows: root.occupied[workspaceId] ?? false

          implicitHeight: 18
          implicitWidth: 18
          radius: 4

          color: {
            if (isActive) return "red"
            if (hasWindows) return "blue"
            return "gray"
          }

          Text {
            text: parent.workspaceId
            anchors.centerIn: parent
            color: "white"
          }

          property bool hovered: false
          MouseArea {
            anchors.fill: parent
            onClicked: Hyprland.dispatch(`workspace ${workspaceId}`)
          }
        }
      }
    }
  }

  Connections {
    target: Hyprland

    function onRawEvent(event) {
      const n = event.name;
      if (n.endsWith("v2")) return;

      if (["workspace", "moveworkspace", "activespecial", "focusedmon"].includes(n)) {
        Hyprland.refreshWorkspaces();
      } else if (["openwindow", "closewindow", "movewindow"].includes(n)) {
        Hyprland.refreshToplevels();
        Hyprland.refreshWorkspaces();
        root.updateOccupied();
      } else if (n.includes("window")) {
        Hyprland.refreshToplevels();
        root.updateOccupied();
      }
    }
  }
}
