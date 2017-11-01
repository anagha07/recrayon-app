import QtQuick 2.8

Item {
    id: baseScreen

    enabled: !stackView.busy

    Rectangle {
        anchors.fill: parent
        color: palette.lightgray
    }
}
