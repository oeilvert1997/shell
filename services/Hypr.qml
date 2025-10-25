pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Hyprland

Singleton {
    id: root

    readonly property var toplevels: Hyprland.toplevels
    readonly property var workspaces: Hyprland.workspaces
    readonly property var monitors: Hyprland.monitors

    readonly property HyprlandToplevel activeToplevel:
        Hyprland.activeToplevel?.wayland?.activated
        ? Hyprland.activeToplevel
        : null
    readonly property HyprlandWorkspace focusedWorkspace: Hyprland.focusedWorkspace
    readonly property HyprlandMonitor focusedMonitor: Hyprland.focusedMonitor
    readonly property int activeWorkspaceId: focusedWorkspace?.id ?? 1

    signal configReloaded

    function dispatch(request: string): void {
        Hyprland.dispatch(request);
    }

    function monitorFor(screen: ShellScreen): HyprlandMonitor {
        return Hyprland.monitorFor(screen);
    }

    Connections {
        target: Hyprland

        function onRawEvent(event: HyprlandEvent): void {
            const n = event.name;

            if (n.endsWith("v2")) return;

            if (n === "configreloaded") {
                root.configReloaded();
            } else if (["workspace", "moveworkspace", "activespecial", "focusedmon"].includes(n)) {
                Hyprland.refreshWorkspaces();
                Hyprland.refreshMonitors()
            } else if (["openwindow", "closewindow", "movewindow"].includes(n)) {
                Hyprland.refreshToplevels();
                Hyprland.refreshWorkspaces();
            } else if (n.includes("mon")) {
                Hyprland.refreshMonitors();
            } else if (n.includes("workspace")) {
                Hyprland.refreshWorkspaces();
            } else if (
                n.includes("window") ||
                n.includes("group") ||
                ["pin", "fullscreen", "changefloatingmode", "minimize"].includes(n)
            ) {
                Hyprland.refreshToplevels();
            }
        }
    }
}
