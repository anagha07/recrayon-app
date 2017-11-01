import QtQuick 2.8
import QtQuick.Controls 1.4
import "../controls"
import "../scripts/Reports.js" as Reports

BaseScreen {
    id: newReportScreen

    function reset() {
        schoolNameTextField.text = ""
        dateTextField.text = Qt.formatDate(new Date(), "MM/dd/yyyy")
        teacherNameTextField.text = ""
        boxesCountTextField.text = ""
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

            text: "New Report"
            font.pixelSize: 32 * dp
            font.bold: true
        }
    }

    ScrollArea {
        id: contentArea

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: toolBar.bottom
        anchors.bottom: parent.bottom

        contentHeight: column.height

        Column {
            id: column

            anchors.left: parent.left
            anchors.right: parent.right

            Label {
                anchors.left: parent.left
                anchors.right: parent.right

                padding: 20 * dp
                font.pixelSize: 26 * dp
                text: "Name of School:"
            }

            TextField {
                id: schoolNameTextField

                anchors.left: parent.left
                anchors.right: parent.right
            }

            Label {
                anchors.left: parent.left
                anchors.right: parent.right

                padding: 20 * dp
                font.pixelSize: 26 * dp
                text: "Date collected:"
            }

            TextField {
                id: dateTextField

                anchors.left: parent.left
                anchors.right: parent.right

                text: Qt.formatDate(new Date(), "MM/dd/yyyy")
                readOnly: true
                onClicked: {
                    calendar.x = newReportScreen.mapFromItem(dateTextField, 0, 0).x
                    calendar.y = newReportScreen.mapFromItem(dateTextField, 0, 0).y
                    calendarPopup.visible = true
                }
            }

            Label {
                anchors.left: parent.left
                anchors.right: parent.right

                padding: 20 * dp
                font.pixelSize: 26 * dp
                text: "Name of Teacher:"
            }

            TextField {
                id: teacherNameTextField

                anchors.left: parent.left
                anchors.right: parent.right

                placeholderText: "Homeroom Teacher's name"
            }

            Label {
                anchors.left: parent.left
                anchors.right: parent.right

                padding: 20 * dp
                font.pixelSize: 26 * dp
                text: "Number of Boxes:"
            }

            TextField {
                id: boxesCountTextField

                anchors.left: parent.left
                anchors.right: parent.right

                placeholderText: "Should be less than 10"

                validator: IntValidator{
                    bottom: 1
                    top: 10
                }
            }

            Item {
                anchors.left: parent.left
                anchors.right: parent.right
                height: 30 * dp
            }

            Row {
                anchors.horizontalCenter: parent.horizontalCenter

                spacing: 30 * dp

                FormButton {
                    text: "Reset"

                    onClicked: {
                        newReportScreen.reset()
                    }
                }

                FormButton {
                    text: "Submit"

                    onClicked: {
                        var month = parseInt(dateTextField.text.slice(0, 2)) - 1
                        var day = parseInt(dateTextField.text.slice(3, 5))
                        var year = parseInt(dateTextField.text.slice(6, 10))
                        var date = new Date(year, month, day, 0, 0, 0, 0)

                        var report = {
                            "school" : schoolNameTextField.text,
                            "teacher" : teacherNameTextField.text,
                            "date" : date.getTime(), // unix timestamp format
                            "boxes" : parseInt(boxesCountTextField.text)
                        }

                        Reports.addReport(report)
                        newReportScreen.forceActiveFocus()
                        newReportScreen.reset()
                    }
                }
            }

            Item {
                anchors.left: parent.left
                anchors.right: parent.right
                height: 30 * dp
            }
        }
    }

    VerticalScrollBar {
        flickable: contentArea
    }

    Popup {
        id: calendarPopup

        Calendar {
            id: calendar

            width: dateTextField.width
            height: 500 * dp

            onClicked: {
                dateTextField.text = Qt.formatDate(selectedDate, "MM/dd/yyyy")
                calendarPopup.visible = false
            }
        }
    }
}
