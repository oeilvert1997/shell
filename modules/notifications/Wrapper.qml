import QtQuick

Item {
    id: root

    // required property var visibilities
    // required property Item panels

    visible: height > 0

    implicitWidth: content.implicitWidth
    implicitHeight: content.implicitHeight

    Content {
        id: content
    }
}
