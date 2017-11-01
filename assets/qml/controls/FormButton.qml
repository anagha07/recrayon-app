import QtQuick 2.8

AbstractButton {
    id: formButton

    width: 250 * dp
    height: 70 * dp

    property alias text: label.text

    Rectangle {
        anchors.fill: parent

        color: palette.darkgray
        radius: 5 * dp
        opacity: formButton.pressed ? 0.5 : 1.0

        Behavior on opacity {
            NumberAnimation {
                duration: 200
            }
        }
    }

    Label {
        id: label

        anchors.fill: parent

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        font.pixelSize: 30 * dp
        font.bold: true
        color: palette.white
    }
}
