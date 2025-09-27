pragma ComponentBehavior: Bound

import QtQuick
import qs.components
import qs.services

StyledRect {
    id: root

    required property Notifs.Notif modelData
    // readonly property bool hasImage: modelData.image.length > 0
    // readonly property bool hasAppIcon: modelData.appIcon.length > 0
    // property bool expanded

    color: "#1e1e2e"

    radius: 8

    visible: modelData !== null

    implicitWidth: 400
    implicitHeight: inner.implicitHeight
    // implicitHeight: 100

    Component.onCompleted: {
        if (modelData)
            modelData.lock(this);
    }

    Component.onDestruction: {
        if (modelData)
            modelData.unlock(this);
    }

    MouseArea {
        anchors.fill: parent

        hoverEnabled: true

        onEntered: root.modelData.timer.stop()

        onExited: {
            if (!pressed)
                root.modelData.timer.start();
        }

        Item {
            id: inner

            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }

            implicitHeight: 100

            StyledText {
                id: summary

                anchors {
                    top: parent.top
                    left: parent.left
                }

                text: summaryMetrics.elidedText

                maximumLineCount: 1

                height: implicitHeight

                font.pixelSize: 16

                color: "#ffffff"
            }

            TextMetrics {
                id: summaryMetrics

                text: root.modelData.summary
                elide: Text.ElideRight
                elideWidth: 300
            }

            StyledText {
                id: bodyPreview

                anchors {
                    bottom: parent.bottom
                    left: parent.left
                }

                text: bodyPreviewMetrics.elidedText

                maximumLineCount: 1

                height: implicitHeight

                font.pixelSize: 14

                color: "#ffffff"
            }

            TextMetrics {
                id: bodyPreviewMetrics

                text: root.modelData.body
                elide: Text.ElideRight
                elideWidth: 300
            }
        }
    }
}
