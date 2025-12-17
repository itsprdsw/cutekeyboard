import CuteKeyboard 1.0
import QtQuick 2.0

Key {
    id: hideKey

    inputPanelRef: inputPanel
    functionKey: true
    showPreview: false
    onClicked: Qt.inputMethod.hide()
    btnBackground: inputPanel.btnSpecialBackgroundColor
    btnIcon: inputPanel.hideKeyboardIcon
    btnIconHeight: parent.height * 0.5
    btnIconWidth: btnIconHeight
}
