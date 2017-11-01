import QtQuick 2.8

AbstractButton {
    id: menuButton

    implicitWidth: 200 * dp
    implicitHeight: 240 * dp

    property alias icon: iconLabel.text
    property alias text: textLabel.text

    Rectangle {
        anchors.fill: parent
        color: palette.gray
        opacity: menuButton.pressed ? 1 : 0
        radius: 5 * dp

        Behavior on opacity {
            NumberAnimation {
                duration: 200
            }
        }
    }

    Label {
        id: iconLabel

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 30 * dp

        font.family: "FontAwesome"
        font.pixelSize: 110 * dp
    }

    Label {
        id: textLabel

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20 * dp
        horizontalAlignment: Text.AlignHCenter

        font.pixelSize: 30 * dp
        font.bold: true
    }
}
