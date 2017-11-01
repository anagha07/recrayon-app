import QtQuick 2.8

Item {
    id: abstractButton

    property bool pressed: false
    signal clicked()

    MouseArea {
        anchors.fill: parent

        onPressed: {
            abstractButton.pressed = true
        }

        onReleased: {
            abstractButton.pressed = false
        }

        onCanceled: {
            abstractButton.pressed = false
        }

        onClicked: {
            abstractButton.clicked()
        }
    }
}
