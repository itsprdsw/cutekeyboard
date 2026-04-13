import CuteKeyboard 1.0
import QtQml 2.0
import QtQuick 2.0

Item {
    id: root

    property bool active: Qt.inputMethod.visible
    property color backgroundColor: "#18181B"
    property color btnBackgroundColor: "#52525C"
    property color btnSpecialBackgroundColor: "#3F3F47"
    property color btnTextColor: "#ffffff"
    property color btnIconColor: "#ffffff"
    property color btnShiftBackgroundColor: "#9F9FA9"

    property string btnTextFontFamily: "Sans"    
    property string languageLayout: "En"
    property string currentLanguage: languageDictionary[languageLayout]
    property string backspaceIcon: "qrc:/images/backspace.svg"
    property string enterIcon: "qrc:/images/enter.svg"
    property string shiftOnIcon: "qrc:/images/shift-on.svg"
    property string shiftOffIcon: "qrc:/images/shift-off.svg"
    property string hideKeyboardIcon: "qrc:/images/hidekeyboard.svg"
    property string languageIcon: "qrc:/images/globe.svg"
    property var availableLanguageLayouts: ["En"]

    property var languageDictionary: {
        "En": "English",
        "Es": "Español",
        "Cs": "Čeština",
        "De": "Deutsch",
        "El": "Ελληνικά",
        "Fr": "Français",
        "It": "Italiano",
        "Nl": "Nederlands",
        "Pl": "Polski",
        "Pt": "Português"
    }

    function showKeyPopup(keyButton) {
        keyPopup.popup(keyButton, root);
    }

    function hideKeyPopup() {
        keyPopup.visible = false;
    }

    function showAlternativesKeyPopup(keyButton) {
        alternativesKeyPopup.open(keyButton, root);
    }

    function loadLettersLayout() {
        if (InputEngine.inputLayoutValid(languageLayout))
            layoutLoader.setSource(languageLayout + "Layout.qml", {
                                       "inputPanel": root
                                   });
        else
            layoutLoader.setSource("EnLayout.qml", {
                                       "inputPanel": root
                                   });
    }

    objectName: "inputPanel"
    width: parent.width
    height: width / 3.2
    onYChanged: InputEngine.setKeyboardRectangle(Qt.rect(x, y, width, height))
    onActiveChanged: {
        if (alternativesKeyPopup.visible && !active)
            alternativesKeyPopup.visible = false;

    }
    onLanguageLayoutChanged: loadLettersLayout()
    Component.onCompleted: {
        if (availableLanguageLayouts.length == 0){
            availableLanguageLayouts = ["En"];
        }
        loadLettersLayout();
    }

    KeyPopup {
        id: keyPopup

        popupColor: btnBackgroundColor
        popupTextColor: btnTextColor
        popupTextFont: btnTextFontFamily
        visible: false
        z: 100
    }

    AlternativeKeysPopup {
        id: alternativesKeyPopup

        visible: false
        z: 100
    }

    MouseArea {
        id: alternativesKeyPopupMouseArea

        visible: alternativesKeyPopup.visible
        enabled: visible
        anchors.fill: parent
        propagateComposedEvents: false
        z: 99
    }

    Rectangle {
        id: keyboardRect

        color: backgroundColor
        anchors.fill: parent

        MouseArea {
            anchors.fill: parent
        }

        Loader {
            id: layoutLoader

            anchors {
                fill: parent
                topMargin: 2
                leftMargin: 35
                rightMargin: 40
                bottomMargin: 25
            }

        }

        Connections {
            target: InputEngine

            function refreshLayouts() {
                if (InputEngine.symbolMode)
                    layoutLoader.setSource("SymbolLayout.qml", {
                                               "inputPanel": root
                                           });
                else if (InputEngine.inputMode === InputEngine.DigitsOnly)
                    layoutLoader.setSource("DigitsLayout.qml", {
                                               "inputPanel": root
                                           });
                else
                    loadLettersLayout();
            }

            function onInputModeChanged() {
                refreshLayouts();
            }

            function onIsSymbolModeChanged() {
                refreshLayouts();
            }
        }

        Connections {
            target: InputPanel
            function onLanguageLayoutChanged() {
                languageLayout = InputPanel.languageLayout;
                loadLettersLayout();
            }
        }

    }

}
