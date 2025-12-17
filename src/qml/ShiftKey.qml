import CuteKeyboard 1.0
import QtQuick 2.0

Key {
    id: shiftKey

    inputPanelRef: inputPanel
    btnKey: Qt.Key_Shift
    functionKey: true
    showPreview: false
    btnBackground: InputEngine.uppercase ? inputPanel.btnShiftBackgroundColor : inputPanel.btnSpecialBackgroundColor
    btnIcon: InputEngine.uppercase ? inputPanel.shiftOnIcon : inputPanel.shiftOffIcon
    btnIconColor: InputEngine.uppercase ? "#27272A" : inputPanel.btnIconColor
    btnIconHeight: parent.height * 0.35
    btnIconWidth: btnIconHeight
    onClicked: InputEngine.uppercase = !InputEngine.uppercase
}
