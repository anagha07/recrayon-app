import QtQuick 2.8

AbstractButton {
    id: toolBarIconButton

    anchors.top: parent.top
    anchors.bottom: parent.bottom
    width: height

    property alias icon: label.text
    property double iconHOffset: 0
    property double iconVOffset: 0

    Rectangle {
        anchors.centerIn: parent
        width: parent.width * 0.6
        height: width
        radius: width / 2
        color: palette.gray
        opacity: toolBarIconButton.pressed ? 1 : 0

        Behavior on opacity {
            NumberAnimation {
                duration: 200
            }
        }
    }

    Label {
        id: label
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: toolBarIconButton.iconHOffset
        anchors.verticalCenterOffset: toolBarIconButton.iconVOffset
        font.family: "FontAwesome"
        font.pixelSize: 40 * dp
    }
}
