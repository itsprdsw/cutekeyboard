import CuteKeyboard 1.0
import QtQuick 2.0

Key {
    id: enterKey

    inputPanelRef: inputPanel
    btnKey: Qt.Key_Enter
    repeatable: true
    showPreview: false
    btnBackground: inputPanel.btnSpecialBackgroundColor
    btnText: "\n"
    btnDisplayedText: inputPanel.enterIcon === "" ? "Enter" : ""
    btnIcon: inputPanel.enterIcon === "" ? "" : inputPanel.enterIcon
    enabled: InputContext.inputItem ? InputContext.inputItem.EnterKeyAction.enabled : true
    opacity: enabled ? 1 : 0.5
}
