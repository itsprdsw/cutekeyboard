import CuteKeyboard 1.0
import QtQuick 2.0

Key {
    id: shiftKey

    inputPanelRef: inputPanel
    btnKey: Qt.Key_Backspace
    repeatable: true
    showPreview: false
    btnBackground: inputPanel.btnSpecialBackgroundColor
    btnIcon: inputPanel.backspaceIcon
}
