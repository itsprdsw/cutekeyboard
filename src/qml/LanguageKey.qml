import CuteKeyboard 1.0
import QtQuick 2.0

Key {
    id: languageKey

    inputPanelRef: inputPanel
    weight: 108.5
    btnKey: Qt.Key_Context2
    btnIcon: inputPanel.languageIcon
    btnIconHeight: parent.height * 0.35
    btnIconWidth: btnIconHeight
    functionKey: true
    showPreview: false
    btnBackground: inputPanel.btnSpecialBackgroundColor
    onClicked: {
        function switchToNextLayout() {
            var indx = inputPanel.availableLanguageLayouts.indexOf(inputPanel.languageLayout);
            if (indx === -1) return inputPanel.availableLanguageLayouts[0];

            var nextIndx = (indx + 1) % inputPanel.availableLanguageLayouts.length;
            var nextLangLayout = inputPanel.availableLanguageLayouts[nextIndx];

            return InputEngine.inputLayoutValid(nextLangLayout) ? nextLangLayout : "En";
        }

        inputPanel.languageLayout = switchToNextLayout();
        if (InputEngine.symbolMode) {
            InputEngine.symbolMode = false;
        }
    }
}
