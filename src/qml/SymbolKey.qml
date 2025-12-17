import CuteKeyboard 1.0
import QtQuick 2.0

Key {
    id: symbolKey

    inputPanelRef: inputPanel
    btnKey: Qt.Key_Context1
    btnDisplayedText: !InputEngine.symbolMode ? "&123" : "ABC"
    functionKey: true
    showPreview: false
    btnBackground: inputPanel.btnSpecialBackgroundColor
    onClicked: InputEngine.symbolMode = !InputEngine.symbolMode
    btnTextFontPixelSize: symbolKey.height * 0.28
}
