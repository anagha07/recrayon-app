import QtQuick 2.8
import "../controls"

BaseScreen {
    id: splashScreen

    Rectangle {
        anchors.fill: parent
        color: palette.beige
    }

    Image {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        fillMode: Image.PreserveAspectFit
        source: "qrc:/images/splash.png"
    }

    Timer {
        interval: 2 * 1000
        repeat: false
        running: true
        onTriggered: {
            stackView.replace(Qt.resolvedUrl("qrc:/qml/screens/MainScreen.qml"), null, true)
        }
    }
}
