import QtQuick 2.0

Item {
    id: toolBar

    height: 110 * dp
    z: 1

    Rectangle {
        anchors.fill: parent

        color: palette.white
    }

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.bottom

        height: 10 * dp

        gradient: Gradient {
            GradientStop { position: 0; color: palette.shadow }
            GradientStop { position: 1; color: palette.transparent }
        }
    }
}
