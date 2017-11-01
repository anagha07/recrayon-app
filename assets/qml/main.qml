import QtQuick 2.8
import QtQuick.Controls 1.4
import "scripts/Reports.js" as Reports
import "controls"
import "screens"

ApplicationWindow {
    visible: true
    width: 720 * dp
    height: 1280 * dp
    title: qsTr("Re-Crayon App")
    scaleFactor: 1.0

    Component.onCompleted: {
        Reports.init()
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: SplashScreen {}
    }

    Item {
        id: overlayItem
        anchors.fill: parent
    }
}
