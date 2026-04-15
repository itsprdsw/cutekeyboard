import CuteKeyboard 1.0
import QtQuick 2.0

Key {
    id: lettersKey

    inputPanelRef: inputPanel
    btnKey: Qt.Key_Context1
    btnDisplayedText: "ABC"
    functionKey: true
    showPreview: false
    btnBackground: inputPanel.btnSpecialBackgroundColor
    onClicked: {
        InputEngine.symbolMode = false
        InputEngine.inputMode = InputEngine.Letters
    }
    btnTextFontPixelSize: lettersKey.height * 0.28
}
