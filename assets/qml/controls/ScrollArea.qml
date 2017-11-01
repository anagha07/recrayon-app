import QtQuick 2.7

Flickable {
    id: scrollArea

    property int implicitPressDelay: 160

    flickableDirection: Flickable.VerticalFlick
    pixelAligned: true
    boundsBehavior: Flickable.StopAtBounds

    VerticalScrollBar {
        flickable: scrollArea
    }
}
