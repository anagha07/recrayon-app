import QtQuick 2.0
import QtQuick.Window 2.2

Item {
    id: popup
    parent: overlayItem
    anchors.fill: parent
    visible: false

    default property alias childrenItems: contentItem.data

    Rectangle {
        anchors.fill: parent
        color: palette.overlay
    }

    MouseArea {
        anchors.fill: parent
        onClicked: popup.visible = false
    }

    Item {
        id: contentItem
        anchors.fill: parent
    }
}
