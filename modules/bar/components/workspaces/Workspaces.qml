import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

RowLayout {
  id: root
  spacing: 0

  property int workspaceCount: 5
  property int groupOffset: 0
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
    Layout.preferredHeight: 30
    Layout.preferredWidth: workspaceRow.implicitWidth + 32
    color: "#1e1e2e"
    radius: 16

    RowLayout {
      id: workspaceRow
      anchors.centerIn: parent
      spacing: 8

      Repeater {
        model: root.workspaceCount

        Workspace {
          activeWsId: root.activeWorkspaceId
          occupied: root.occupied
          groupOffset: root.groupOffset
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
