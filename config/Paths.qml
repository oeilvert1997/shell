pragma Singleton

import Quickshell

Singleton {
    id: root

    readonly property string cache: `${Quickshell.env("XDG_CACHE_HOME") || `${home}/.cache`}/shell`
    readonly property string state: `${Quickshell.env("XDG_STATE_HOME") || `${home}/.local/state`}/shell`

    readonly property string imageCache: `${cache}/imagecache`
    readonly property string notificationImageCache: `${imageCache}/notifs`
}
