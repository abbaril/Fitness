import QtQuick
import Fitness 1.0

Item {

    property string activityType: "cycling"

    TextDisplay {
        id: textTimeDisplayer
    }

    Rectangle {
        id: background
        anchors.fill: parent
        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: "#BCFF79"
            }
            GradientStop {
                position: 1.0
                color: "#57AE00"
            }
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

        MouseArea {
            anchors.fill: parent
            onClicked: stackView.pop()
        }
    }

    Rectangle {
        id: cyclingImageBackground
        width: parent.width * .7
        height: width
        radius: width / 2
        color: "#707070"
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height / 6

        Image {
            width: parent.width * .7
            height: parent.height * .7
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
            source: {
                if (activityType === "cycling")
                    return "qrc:/qt/qml/Fitness/assets/cycling.png";
                else if (activityType === "running")
                    return "qrc:/qt/qml/Fitness/assets/run.png";
                else
                    return "qrc:/qt/qml/Fitness/assets/swimming.png";
            }
        }
    }


    //Distance text
    Text {
        id: distanceText
        anchors {
            top: cyclingImageBackground.bottom
            topMargin: 30
            left: cyclingImageBackground.left
        }
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        font.pixelSize: 15
        color: "white"
        text: "Distance<br>" + textTimeDisplayer.distance
    }



    //Timetext
    Text {
        id: timeText
        anchors {
            top: cyclingImageBackground.bottom
            topMargin: 30
            right: cyclingImageBackground.right
        }
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        font.pixelSize: 15
        color: "white"
        text: "Total Time<br>" + textTimeDisplayer.displayText
    }



    //Pacetext
    Text {
        id: paceText
        anchors {
            top: distanceText.bottom
            topMargin: 40
            horizontalCenter: distanceText.horizontalCenter
        }
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        font.pixelSize: 15
        color: "white"
        text: "Pace<br>" + textTimeDisplayer.pace
    }



    //Heartrate text
    Text {
        id: heartRateText
        anchors {
            top: distanceText.bottom
            topMargin: 40
            horizontalCenter: timeText.horizontalCenter
        }
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        font.pixelSize: 15
        color: "white"
        text: "Heart Rate<br>" + textTimeDisplayer.heartRate
    }



    Row {
        anchors {
            bottom: parent.bottom
            bottomMargin: 30
            horizontalCenter: parent.horizontalCenter
        }
        spacing: 20



        // Start Button
        Rectangle {
            id: startButton
            width: 60
            height: 60
            radius: 30
            color: "#707070"
            Image {
                anchors.centerIn: parent
                source: "qrc:/qt/qml/Fitness/assets/play-button.png"
                width: parent.width * 0.5
                height: parent.height * 0.5
                fillMode: Image.PreserveAspectFit
            }
            MouseArea {
                anchors.fill: parent
                onPressed: startButton.color = "#575757"
                onReleased: startButton.color = "#707070"
                onClicked: textTimeDisplayer.startTimer()
            }
        }


        // Pause Button
        Rectangle {
            id: pauseBtn
            width: 60
            height: 60
            radius: 30
            color: "#707070"
            Image {
                anchors.centerIn: parent
                source: "qrc:/qt/qml/Fitness/assets/pause.png"
                width: parent.width * 0.5
                height: parent.height * 0.5
                fillMode: Image.PreserveAspectFit
            }
            MouseArea {
                anchors.fill: parent
                onPressed: pauseBtn.color = "#575757"
                onReleased: pauseBtn.color = "#707070"
                onClicked: textTimeDisplayer.pauseTimer()
            }
        }



        // Stop Button
        Rectangle {
            id: stopButton
            width: 60
            height: 60
            radius: 30
            color: "#707070"
            Image {
                anchors.centerIn: parent
                source: "qrc:/qt/qml/Fitness/assets/stop-button.png"
                width: parent.width * 0.5
                height: parent.height * 0.5
                fillMode: Image.PreserveAspectFit
            }
            MouseArea {
                anchors.fill: parent
                onPressed: stopButton.color = "#575757"
                onReleased: stopButton.color = "#707070"
                onClicked: textTimeDisplayer.stopTimer()
            }
        }
    }
}
