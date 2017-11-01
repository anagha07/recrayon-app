import QtQuick 2.7

Rectangle {
    id: verticalScrollBar

    property Flickable flickable

    parent: flickable

    anchors.right: parent.right
    width: Math.round(7 * dp)
    height: parent.height * flickable.visibleArea.heightRatio
    y: parent.height * flickable.visibleArea.yPosition

    visible: flickable.visibleArea.heightRatio < 1
    opacity: 0

    color: palette.overlay

    Connections {
        target: flickable

        onMovingChanged: {
            verticalScrollBar.opacity = (flickable.moving ? 1 : 0)
        }
    }

    Behavior on opacity {
        PropertyAnimation {
            duration: 200
        }
    }
}
