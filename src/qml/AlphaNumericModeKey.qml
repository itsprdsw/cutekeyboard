import CuteKeyboard 1.0
import QtQuick 2.0

Key {
    id: alphaNumericModeKey

    inputPanelRef: inputPanel
    btnKey: Qt.Key_Context1
    btnDisplayedText: "ABC"
    functionKey: true
    showPreview: false
    btnBackground: inputPanel.btnSpecialBackgroundColor
    onClicked: {
        console.log("**** alphaNumericModeKey OnClicked ****")
        InputEngine.symbolMode = false
        InputEngine.inputMode = InputEngine.Letters
    }
    btnTextFontPixelSize: alphaNumericModeKey.height * 0.28
}
