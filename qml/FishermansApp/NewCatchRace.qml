import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

Item {
    id: root
        width: parent.width
        height: parent.height-75
//    width: 400
//    height: 600
    property real progress: 0

        signal buttonClicked

        property string fishArt: ""

    function getWidth() {
        return root.width
    }

    function setFish(fish){
        fishArt = fish
    }
    function getFish(){
        return fishArt
    }

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

    Column {
        id: column1
        width: parent.width
        height: parent.height
        spacing: 40
        anchors.centerIn: parent

        Item {
            id: item1
            width: parent.width
            height: parent.height - 70

            //ListModel für Gesamtübersicht
            ListView {
                id: listView
                anchors.fill: parent
                anchors.margins: 5
                model: listModelFische
                delegate: listFishes
                highlight: highlightBar
                highlightFollowsCurrentItem: false
                focus: true
                spacing: 5
            }
        }
    }

    Component {
        id: buttonTouchStyle
        ButtonStyle {
            panel: Item {
                implicitHeight: 50
                implicitWidth: 400
                //root.width

                BorderImage {
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

    Component {
        id: touchStyle

        TextFieldStyle {
            textColor: "white"
            //font.pixelSize: 28
            background: Item {
                implicitHeight: 50
                implicitWidth: 400 //root.width
                BorderImage {
                    source: "../FishermansApp/Images/textinput.png"
                    border.left: 8
                    border.right: 8
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                }
            }
        }
    }
    ListModel {
        id: listModelFische

        ListElement {
            art: "Aal"
        }
        ListElement {
            art: "Barsch"
        }
        ListElement {
            art: "Hecht"
        }
        ListElement {
            art: "Fisch"
        }
        ListElement {
            art: "Karpfen"
        }
        ListElement {
            art: "Forelle"
        }
        ListElement {
            art: "Aal"
        }
        ListElement {
            art: "Barsch"
        }
        ListElement {
            art: "Hecht"
        }
        ListElement {
            art: "Fisch"
        }
        ListElement {
            art: "Karpfen"
        }
        ListElement {
            art: "Forelle"
        }
        ListElement {
            art: "Barsch"
        }
        ListElement {
            art: "Hecht"
        }
        ListElement {
            art: "Fisch"
        }
        ListElement {
            art: "Karpfen"
        }
        ListElement {
            art: "Forelle"
        }
    }

    Component {
        id: listFishes

        Item {
            width: getWidth()
            height: 60

            Row {
                width: getWidth()
                height: 60
                Item {

                    //spacing: 5
                    width: {getWidth() / 2
                    }
                    height: 60
                    Text {
                        width: {getWidth() / 2}
                        text: art
                        x: 4
                        font.pixelSize: 22
                    }
                    Rectangle {
                        anchors.bottom: parent.bottom
                        width: parent.width

                        height: 2
                        color: "#d1d1d1"
                    }
                }
                Item {
                    width: {
                        getWidth() / 2
                    }
                    height: parent.height
                    Rectangle {
                        //anchors.fill: parent
                        width: parent.width - 15
                        height: 60
                        y: - 3
                        color: "#000000"
                    }
                    Rectangle {
                        anchors.bottom: parent.bottom
                        width: parent.width - 12

                        height: 2
                        color: "#d1d1d1"
                    }
                }
            }
            MouseArea {
                anchors.fill: parent
                onEntered: {

                }

                onExited: {

                }

                onCanceled: {

                }

                onClicked: {
                   // console.debug("clicked:" + index)
                    //set the selected index
                    listView.currentIndex = index

                    //console.debug(listModelFische.get(index).art)
                    setFish(listModelFische.get(index).art)

                    buttonClicked()
                }
            }
        }
    }

    Component {
        id: highlightBar
        Rectangle {
            width: parent.width
            height: 58
            radius: 3
            color: "lightsteelblue"
            y: listView.currentItem.y -2
            x: listView.currentItem.x
            Behavior on y {
                PropertyAnimation {
                    duration:10
                }
            }
        }
    }


    Item {
        id: tool_bar2
        width: parent.width
        height: 0.09375 * parent.height
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        z: 10
        ToolBar {
            id: nmae13
            width: parent.width
            height: parent.height
            Row {
                id: row1
                width: parent.width
                height: parent.height

                anchors.topMargin: 15
                spacing: 7

                TextField {
                    id: textfield1
                    width: parent.width - 60
                    height: 50
                    anchors.margins: 20
                    text: "suchen"
                    textColor: "#000000"
                    anchors.verticalCenter: parent.verticalCenter
                    style: touchStyle
                    font.pixelSize: 25
                }

                Button {
                    width: 50
                    text: "?"

                    anchors.leftMargin: 8
                    anchors.verticalCenter: textfield1.verticalCenter
                    anchors.margins: 20
                    style: buttonTouchStyle

                    onClicked: {
                        console.log("Clicked")
                    }
                }
            }
        }
    }
}
