import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

Item {
    height: 50
    width: parent.width

    id:root
    property int buttonWidth: 0

    signal buttonPressed

    function setButtonWidth(width){
        root.width = width
    }



    property string  buttonText: "Press me"

    property real progress: 0
    SequentialAnimation on progress {
        loops: Animation.Infinite
        running: true
        NumberAnimation {
            from: 0
            to: 1
            duration: 3000
        }
        NumberAnimation {
            from: 1
            to: 0
            duration: 3000
        }
    }

    Button {
        anchors.margins: 20
        text: buttonText
        anchors.horizontalCenter: parent.horizontalCenter
        z: 2
        enabled: true
        style: touchStyle

        MouseArea {
            id: mousearea1

            anchors.fill: parent

            onClicked:{
                buttonPressed()
                //pressed
                console.log("NEW CATCH PRESSED")
            }
        }
    }

    Component {
        id: touchStyle
        ButtonStyle {
            panel: Item {
                implicitHeight: 50
                implicitWidth: 340

                BorderImage {
                    opacity: 1
                    anchors.fill: parent
                    antialiasing: true
                    border.bottom: 8
                    border.top: 8
                    border.left: 8
                    border.right: 8
                    anchors.margins: control.pressed ? -4 : 0
                    source: control.pressed ? "../FishermansApp/Images/button_pressed.png" : "../FishermansApp/Images/button_default.png"
                    Text {
                        text: control.text
                        anchors.centerIn: parent
                        color: "white"
                        font.pixelSize: 23
                        renderType: Text.NativeRendering
                    }
                }
            }
        }
    }
}
