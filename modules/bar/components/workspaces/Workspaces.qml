pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import qs.services

RowLayout {
    id: root
    spacing: 0

    property int workspaceCount: 5
    property int groupOffset: 0
    property int activeWorkspaceId: Hypr.activeWorkspaceId
    property var occupied: ({})

    function updateOccupied() {
        let occ = {};
        let toplevels = Hypr.toplevels.values;
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
        target: Hypr.toplevels
        function onValuesChanged() {
            root.updateOccupied();
        }
    }

    Connections {
        target: Hypr.focusedWorkspace
        function onIdChanged() {
        }
    }
}
