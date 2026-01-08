import QtQuick 2.0

Key {
    id: spaceKey

    btnKey: Qt.Key_Space
    btnText: " "
    btnDisplayedText: inputPanelRef.currentLanguage
    showPreview: false
    repeatable: true
    btnTextFontCapitalization: Font.MixedCase
}
