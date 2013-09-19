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
        id: listModelFischeGesamt

        ListElement {
            anzahl: 202
            length: 3.45
            weight: 10.34
        }

    }

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
            race: 202
            length: 3.45
            weight: 10.34
        }
        ListElement {
            race: 202
            length: 3.45
            weight: 10.34
        }
        ListElement {
            race: 202
            length: 3.45
            weight: 10.34
        }
        ListElement {
            race: 202
            length: 3.45
            weight: 10.34
        }
        ListElement {
            race: 202
            length: 3.45
            weight: 10.34
        }
        ListElement {
            race: 202
            length: 3.45
            weight: 10.34
        }
    }

    Component {
        id: listOverview

        Item {
            width: parent.width
            height: 100

            Row {
                Column {
                    width: {getWidth()/2}
                    Text {
                        text: 'Übersicht: '
                        x:4
                        font.pixelSize: 22
                    }
                    Text {
                        text: 'Fische gefangen: ' + anzahl
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
                        color:"#dddddd"
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
        anchors.fill: parent
        anchors.margins: 5
        model: listModelFischeGesamt
        delegate: listOverview
        highlight: highlightBar
        highlightFollowsCurrentItem: false
        focus: true
        spacing: 3

    }
    OverviewFishes {
        y:110
        width:parent.width
        height: parent.height

     }
//    ListView {
//        id: listView1
//        y:100
//        anchors.fill: parent
//        anchors.margins: 5
//        model: listModelFische
//        delegate: listFishes
//        highlight: highlightBar
//        highlightFollowsCurrentItem: false
//        focus: true
//        spacing: 3
//    }

    Component.onCompleted: {
        //listView.model = listModelFische
    }
}
