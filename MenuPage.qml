import QtQuick

Item {

    Rectangle {
        id: background
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#BCFF79" }
            GradientStop { position: 1.0; color: "#57AE00" }
        }
    }


    Image {
        id: menuDrawer
        width: parent.width / 10
        height: width
        source: "qrc:/qt/qml/Fitness/assets/menu.png"
        anchors {
            top: parent.top
            left: parent.left
            margins: 15
        }
    }

    MenuButton {
        id: bikeButton
        buttonImageSource: "qrc:/qt/qml/Fitness/assets/cycling.png"
        anchors {
            bottom: runButton.top
            bottomMargin: 20
            horizontalCenter: parent.horizontalCenter
        }

        onButtonClicked: stackView.push("DisplayPage.qml", { activityType: "cycling" })
        width: parent.width * .6
    }

    MenuButton {
        id: runButton
        buttonImageSource: "qrc:/qt/qml/Fitness/assets/run.png"
        anchors.centerIn: parent
        width: parent.width * .6
        onButtonClicked: stackView.push("DisplayPage.qml", { activityType: "running" })
    }

    MenuButton {
        id: swimmingButton
        buttonImageSource: "qrc:/qt/qml/Fitness/assets/swimming.png"
        anchors {
            top: runButton.bottom
            topMargin: 20
            horizontalCenter: parent.horizontalCenter
        }

        width: parent.width * .6
        onButtonClicked: stackView.push("DisplayPage.qml", { activityType: "swimming" })
    }

}
