import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    width: 300
    height: 600
    visible: true
    title: qsTr("Fitness")

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: "MenuPage.qml"
    }

}
