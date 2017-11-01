import QtQuick 2.8
import QtQuick.Window 2.3
import "../components"

Window {
    visible: true
    color: palette.lightgray

    property double scaleFactor: 1.0
    readonly property double dp: Screen.pixelDensity * 25.4 / 160 * scaleFactor
    readonly property Palette palette: Palette {}
}
