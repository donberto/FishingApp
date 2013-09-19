import QtQuick 2.0

Item {
    id: item1
    width: 400
    height: 220

    signal pressed

    property string headerText: "noInit"

    property bool imageActive: true
    //depending on imageActive set rows and columns and so on the correct sizes

    onPressed: {console.log("onPressed")}

    MouseArea {
        id: mousearea1
        anchors.fill: parent

        onClicked: {
            pressed
            console.log("EQUIP PRESSED")
        }
    }

    Column{
        id: column1
        anchors.top: parent.top
        width: parent.width
        height: parent.height
        spacing: 0

    Row {
        id: row1
        width: parent.width
        height: 60
        anchors.top: parent.top
        anchors.topMargin: 0

        Rectangle {
            id: rectangle2
            width: parent.width
            height: 60
            color: "#2d2d2d"
        }

        Column {
            id: column4
            x: 100
            width: parent.width * 0.96
            height: 53
            anchors.top: parent.top
            anchors.topMargin: 7
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                color: "#ffffff"
                text: headerText
                anchors.verticalCenterOffset: -4
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: 28
                font.family: "MS UI Gothic"
            }
        }
    }

    Row {
        id: row5
        width: 200
        height: 4* 40
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: row1.bottom
        anchors.topMargin: 0

        Column {
            id: column3
            width: parent.width /2
            height: parent.height
            anchors.left: column2.right
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0

            Rectangle {
                id: rectangle1
                width:parent.width
                height: parent.height-3
                color: "#0b0b0b"

                Text {
                    id: text5

                    color: "#ffffff"
                    text: qsTr("Image")
                    font.pointSize: 33
                    wrapMode: Text.WordWrap
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Rectangle {
                id: divider1
                x: 6
                y: -9
                width: parent.width
                height: 3
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottomMargin: 0
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#64c4ff"
                    }

                    GradientStop {
                        position: 1
                        color: "#009dff"
                    }
                }
                anchors.topMargin: -640
            }
        }

        Column {
            id: column2
            width: parent.width * 3/2
            height: parent.height
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0

            Row {
                id: row4
                width: parent.width
                height: 40
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 0
                anchors.top: parent.top

                Text {
                    id: text3
                    color: "#ffffff"
                    text: qsTr("Rute: DAMSuperangel 1000")
                    font.pointSize: 12
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            Row {
                id: row3
                width: parent.width
                height: 40
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: row4.bottom
                anchors.topMargin: 0

                Text {
                    id: text2
                    color: "#ffffff"
                    text: qsTr("Rolle: Shimano Super Rolle")
                    font.pointSize: 12
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            Row {
                id: row2
                width: parent.width
                height: 40
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: row3.bottom
                anchors.topMargin: 0

                Text {
                    id: text1
                    color: "#ffffff"
                    text: qsTr("Schnur: LALA Superschnur 0,25")
                    font.pointSize: 12
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            Row {
                id: row6
                x: 0
                width: parent.width
                height: 40
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 0
                Text {
                    id: text4
                    color: "#ffffff"
                    text: qsTr("Köder: Jerkbait Super Köder 12cm")
                    font.pointSize: 12
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                }
                anchors.top: row2.bottom
            }

            Rectangle {
                id: divider
                width: parent.width
                height: 3
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#64c4ff"
                    }

                    GradientStop {
                        position: 1
                        color: "#009dff"
                    }
                }
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: mousearea1.bottom
                anchors.topMargin: -640
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
            }
        }

    }
    }

    }
