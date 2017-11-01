import QtQuick 2.8

FocusScope {
    id: textField

    height: 80 * dp

    property alias text: textInput.text
    property alias placeholderText: placeholderLabel.text
    property alias validator: textInput.validator
    property bool readOnly: false
    signal clicked()

    Rectangle {
        anchors.fill: parent
        color: palette.white
    }

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: Math.round(1 * dp)
        color: palette.gray
    }

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: Math.round(1 * dp)
        color: palette.gray
    }

    Label {
        id: placeholderLabel

        anchors.fill: parent
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        leftPadding: 20 * dp
        rightPadding: 20 * dp

        font.pixelSize: 30 * dp
        color: palette.darkgray
        visible: (textInput.text.length === 0) && (!textInput.activeFocus)
    }

    TextInput {
        id: textInput

        anchors.fill: parent
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        leftPadding: 20 * dp
        rightPadding: 20 * dp

        focus: true

        font.family: "Roboto"
        font.pixelSize: 30 * dp
    }

    MouseArea {
        anchors.fill: parent

        enabled: textField.readOnly

        onClicked: {
            textField.clicked()
        }
    }
}
