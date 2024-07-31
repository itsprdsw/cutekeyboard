import CuteKeyboard 1.0
import QtQuick 2.0

Key {
    weight: 108.5
    btnKey: Qt.Key_Context2
    btnIcon: InputPanel.languageIcon
    functionKey: true
    showPreview: false
    btnBackground: InputPanel.btnSpecialBackgroundColor
    onClicked: {
        function switchToNextLayout() {
            var indx = InputPanel.availableLanguageLayouts.indexOf(InputPanel.languageLayout);
            if (indx === -1) return InputPanel.availableLanguageLayouts[0];

            var nextIndx = (indx + 1) % InputPanel.availableLanguageLayouts.length;
            var nextLangLayout = InputPanel.availableLanguageLayouts[nextIndx];

            return InputEngine.inputLayoutValid(nextLangLayout) ? nextLangLayout : "En";
        }

        InputPanel.languageLayout = switchToNextLayout();
        if (InputEngine.symbolMode) {
            InputEngine.symbolMode = false;
        }
    }
}
