import CuteKeyboard 1.0
import QtQuick 2.0

Key {
    id: numericModeKey

    inputPanelRef: inputPanel
    btnKey: Qt.Key_Context1
    btnDisplayedText: "123"
    functionKey: true
    showPreview: false
    btnBackground: inputPanel.btnSpecialBackgroundColor
    onClicked: {
        InputEngine.symbolMode = false
        InputEngine.inputMode = InputEngine.DigitsOnly
    }
    btnTextFontPixelSize: numericModeKey.height * 0.28
}
