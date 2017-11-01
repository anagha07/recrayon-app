import QtQuick 2.8
import QtQuick.Controls 1.4
import "../controls"
import "../scripts/Reports.js" as Reports

BaseScreen {
    id: reportsScreen

    Component.onCompleted: {
        var fromDate = new Date()
        var toDate = new Date()
        fromDate.setHours(0, 0, 0, 0)
        toDate.setHours(23, 59, 59, 999)
        reportsRepeater.model = Reports.reports(fromDate.getTime(), toDate.getTime())
    }

    ToolBar {
        id: toolBar

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top

        ToolBarIconButton {
            id: backButton

            iconHOffset: -2 * dp
            icon: "\uf104"

            onClicked: stackView.pop()
        }

        Label {
            anchors.left: backButton.right
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter

            text: "Recrayon Report"
            font.pixelSize: 32 * dp
            font.bold: true
        }
    }

    Column {
        id: datesColumn

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: toolBar.bottom

        Label {
            anchors.left: parent.left
            anchors.right: parent.right

            padding: 20 * dp
            font.pixelSize: 26 * dp
            text: "From:"
        }

        TextField {
            id: dateFromTextField

            anchors.left: parent.left
            anchors.right: parent.right

            text: Qt.formatDate(new Date(), "MM/dd/yyyy")
            readOnly: true
            onClicked: {
                calendarFrom.x = reportsScreen.mapFromItem(dateFromTextField, 0, 0).x
                calendarFrom.y = reportsScreen.mapFromItem(dateFromTextField, 0, 0).y
                calendarFromPopup.visible = true
            }
        }

        Label {
            anchors.left: parent.left
            anchors.right: parent.right

            padding: 20 * dp
            font.pixelSize: 26 * dp
            text: "To:"
        }

        TextField {
            id: dateToTextField

            anchors.left: parent.left
            anchors.right: parent.right

            text: Qt.formatDate(new Date(), "MM/dd/yyyy")
            readOnly: true
            onClicked: {
                calendarTo.x = reportsScreen.mapFromItem(dateToTextField, 0, 0).x
                calendarTo.y = reportsScreen.mapFromItem(dateToTextField, 0, 0).y
                calendarToPopup.visible = true
            }
        }
    }

    ScrollArea {
        id: scrollArea

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: datesColumn.bottom
        anchors.bottom: parent.bottom
        anchors.topMargin: 20 * dp

        contentHeight: reportsColumn.height
        clip: true

        Column {
            id: reportsColumn

            anchors.left: parent.left
            anchors.right: parent.right

            Repeater {
                id: reportsRepeater

                delegate: Column {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 20 * dp

                    Label {
                        anchors.left: parent.left
                        anchors.right: parent.right

                        font.pixelSize: 26 * dp

                        text: "School: %1".arg(modelData.school)
                    }

                    Label {
                        anchors.left: parent.left
                        anchors.right: parent.right

                        font.pixelSize: 26 * dp

                        text: "Teacher: %1".arg(modelData.teacher)
                    }

                    Label {
                        anchors.left: parent.left
                        anchors.right: parent.right

                        font.pixelSize: 26 * dp

                        text: "Date: %1".arg(Qt.formatDate(new Date(modelData.date), "MM/dd/yyyy"))
                    }

                    Label {
                        anchors.left: parent.left
                        anchors.right: parent.right

                        font.pixelSize: 26 * dp

                        text: "Boxes: %1".arg(modelData.boxes)
                    }

                    Item {
                        anchors.left: parent.left
                        anchors.right: parent.right
                        height: 20 * dp
                    }
                }
            }
        }
    }

    VerticalScrollBar {
        flickable: scrollArea
    }

    Popup {
        id: calendarFromPopup

        Calendar {
            id: calendarFrom

            width: dateFromTextField.width
            height: 500 * dp
            maximumDate: calendarTo.selectedDate

            onClicked: {
                dateFromTextField.text = Qt.formatDate(selectedDate, "MM/dd/yyyy")
                calendarFromPopup.visible = false
            }

            onSelectedDateChanged: {
                var fromDate = selectedDate
                var toDate = calendarTo.selectedDate
                fromDate.setHours(0, 0, 0, 0)
                toDate.setHours(23, 59, 59, 999)
                reportsRepeater.model = Reports.reports(fromDate.getTime(), toDate.getTime())
            }
        }
    }

    Popup {
        id: calendarToPopup

        Calendar {
            id: calendarTo

            width: dateToTextField.width
            height: 500 * dp
            minimumDate: calendarFrom.selectedDate

            onClicked: {
                dateToTextField.text = Qt.formatDate(selectedDate, "MM/dd/yyyy")
                calendarToPopup.visible = false
            }

            onSelectedDateChanged: {
                var fromDate = calendarFrom.selectedDate
                var toDate = selectedDate
                fromDate.setHours(0, 0, 0, 0)
                toDate.setHours(23, 59, 59, 999)
                reportsRepeater.model = Reports.reports(fromDate.getTime(), toDate.getTime())
            }
        }
    }
}
