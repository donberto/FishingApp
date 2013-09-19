import QtQuick 2.0

Item {
    id: overviewWindow
    height: parent.height
    width: parent.width

    function getWidth(){
        return overviewWindow.width
    }

    property string overviewHeaderText: "noInit"

    property bool imageActive: true

    //ListModel für Gesamtübersicht
    ListModel {
        id: listModelFische

        ListElement {
            race: "Barsch"
            length: 2.45
            weight: 10.2
        }
        ListElement {
            race: "Barsch"
            length: 1.45
            weight: 10.2
        }
        ListElement {
            race: "Barsch"
            length: 3.45
            weight: 10.34
        }
        ListElement {
            race: "Barsch"
            length: 3.45
            weight: 10.34
        }
        ListElement {
            race: "Barsch"
            length: 3.45
            weight: 10.34
        }
        ListElement {
            race: "Barsch"
            length: 3.45
            weight: 10.34
        }
        ListElement {
            race: "Barsch"
            length: 3.45
            weight: 10.34
        }
        ListElement {
            race: "Barsch"
            length: 3.45
            weight: 10.34
        }
        ListElement {
            race: "Barsch"
            length: 3.45
            weight: 10.34
        }
    }

    Component {
        id: listFishes

        Item {
            width: parent.width
            height: 100
            Row {
                Column {
                    width: {getWidth()/2}
                    Text {
                        text: 'Fische gefangen: ' + race
                        x:4
                        font.pixelSize: 18
                    }
                    Text {
                        text: 'Längster Fisch:' + length
                        x:4
                        font.pixelSize: 18
                    }
                    Text {
                        text: 'Schwerster Fisch:' + weight
                        x:4
                        font.pixelSize: 18
                    }
                }
                Column {

                    width: {getWidth()/2}
                    height: parent.height
                    Rectangle{
                        width: parent.width - 40
                       height: 100
                        x: 30
                        color:"#000000"
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
                    console.debug("clicked:" + index)
                    listView.currentIndex = index
                }
            }
        }
    }


    Component {
        id: highlightBar
        Rectangle {
            width: parent.width
            height: 100
            radius: 3
            color: "lightsteelblue"
            y: listView.currentItem.y
            x: listView.currentItem.x
            Behavior on y {
                PropertyAnimation {
                }
            }
        }
    }

    ListView {
        id: listView
        y:100
        anchors.fill: parent
        anchors.margins: 5
        model: listModelFische
        delegate: listFishes
        highlight: highlightBar
        highlightFollowsCurrentItem: false
        focus: true
        spacing: 3
    }

    Component.onCompleted: {
        //listView.model = listModelFische


    }

}
