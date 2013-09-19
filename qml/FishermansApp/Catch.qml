import QtQuick 2.0
import QtQuick.Controls 1.0
import QtMultimedia 5.0

Item {
    //    width:parent.width
    //    height: parent.height
    id: root
    width: 400
    height: 500
    property string art: ""
    property string laenge: ""
    property string gewicht: ""
    property string ort: ""
    property string datum: ""
    property string uhrzeit: ""
    property string fotoURL: ""

    signal buttonClicked

    function setArt(fish){
        art = fish
       // console.log(art)
    }
    function getArt(){
        return art
    }
    function setLaenge(fish){
        laenge = fish
    }
    function getLaenge(){
        return laenge
    }
    function setGewicht(fish){
        gewicht = fish
    }
    function getGewicht(){
        return gewicht
    }

    function setDatum(date){
        datum = date
    }
    function setZeit(time){
        uhrzeit = time
    }

    function setFoto(foto){
        fotoURL = foto
    }

    function getFoto(){
        return fotoURL
    }

    //    Equipment{
    //        id: equipment
    //    }
    Rectangle {
        id: rectangle1

        width: parent.width
        height: parent.height
        color: "#00000000"

        Column {
            id: column1
            anchors.fill: parent

            Item {
                id: item1
                width: parent.width
                height: parent.height/8

                Text {
                    id: text1
                    text: qsTr("Fang 1")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 30
                }
            }

            Item {
                id: item3
                y: 0
                width: parent.width
                height: (parent.height * 4 / 8)

                Item {
                    id: rectangle2
                    //color: "#00000000"
                    anchors.fill: parent

                    Image{
                        anchors.fill: parent

                        source: getFoto()
                    }
                }
            }
Item{
    width: parent.width
    height: parent.height * 3 / 8
            Row {
                id: row1

                width: parent.width
                height: parent.heigth

                anchors.topMargin: 0

                Column {
                    id: column2

                    width: parent.width / 3
                    height: parent.height

                    Text {
                        id: text2
                        width: parent.width - 20

                        text: "Fischart: "+ art
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        font.pointSize: 14

                    }
                    Text {
                        id: text3
                        width: parent.width - 20
                        text: qsTr("Länge: "+ laenge + "cm")
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        font.pointSize: 14
                    }
                    Text {
                        id: text4
                        width: parent.width - 20
                        text: qsTr("Gewicht: "+ gewicht + "kg")
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        font.pointSize: 14
                    }

                    Text {
                        id: text5
                        width: parent.width - 20

                        text: qsTr("Ort: "+ ort)
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        font.pointSize: 14

                    }
                    Text {
                        id: text6
                        width: parent.width - 20
                        text: qsTr("Uhrzeit: "+ uhrzeit)
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        font.pointSize: 14
                    }
                    Text {
                        id: text7
                        width: parent.width - 20
                        text: qsTr("Datum: "+ datum)
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        font.pointSize: 14
                    }
                }

                Item {
                    id: item2
                    x: 0
                    y: 0
                    width: parent.width * 2 / 3
                    height: parent.height

                    Rectangle {
                        width:150
                        height:150
                        id: rectangle3
                        x: 241
                        y: 0
                        color: "#c0c0c0"
                        radius: 5

                        Rectangle {
                            id: rectangle4
                            x: 44
                            y: 43
                            width: 140
                            height: 140
                            color: "#ffffff"
                            radius: 2
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter

                            Rectangle {
                                id: rectangle5
                                x: 40
                                y: 44
                                width: parent.width
                                height: 20
                                color: "#e4e4e4"
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: 0
                                anchors.horizontalCenter: parent.horizontalCenter

                                Text {
                                    id: text8
                                    x: 68
                                    y: -307
                                    width: parent.width
                                    height: parent.height
                                    color: "#000000"
                                    text: qsTr("FishingDude")
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    font.pixelSize: 12
                                }
                            }
                        }
                    }
                }
            }
}
        }
    }
    Item {
        id: tool_bar2
        width: parent.width
        height: 50
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        z: 10
        ToolBar {
            id: nmae13
            width: mainView.width
            height: parent.height
        }

        CatchButton {
            id: catchbutton1
            x: 0
            y: 0
            width: {
                parent.width * 0.9
            }
            height: 50
            z: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
            onButtonPressed: {

                //console.log("NEW CATCH CLICKED")
                tool_bar2.visible = false
                buttonClicked()
            }
            buttonText: "Fang abspeichern"
            anchors.horizontalCenterOffset: 0
        }
    }
}
