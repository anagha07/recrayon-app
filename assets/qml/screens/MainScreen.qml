import QtQuick 2.8
import "../controls"

BaseScreen {
    id: mainScreen

    ToolBar {
        id: toolBar

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top

        Label {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 26 * dp

            text: "Re-Crayon App"
            font.pixelSize: 32 * dp
            font.bold: true
        }
    }

    Item {
        id: contentArea

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: toolBar.bottom
        anchors.bottom: parent.bottom

        Row {
            anchors.centerIn: parent
            spacing: 50 * dp

            MenuButton {
                icon: "\uf016"
                text: "New Report"
                onClicked: stackView.push(Qt.resolvedUrl("qrc:/qml/screens/NewReportScreen.qml"))
            }

            MenuButton {
                icon: "\uf0f6"
                text: "See Reports"
                onClicked: stackView.push(Qt.resolvedUrl("qrc:/qml/screens/ReportsScreen.qml"))
            }
        }
    }
}
