import QtQuick 2.1

import QtQuick.Controls 1.0
import QtMultimedia 5.0
import QtQuick.LocalStorage 2.0

Item {
    id: mainView
    width: 400
    height: 667

    property string date: ""
    property string time: ""
    property string dateFormatted: ""
    property string fotoUrl: ""

    function getDate() {
        date = Qt.formatDateTime(new Date(), "ddMMyy")
        setDate(date)
    }
    function setDate(date) {
        //dateFormatted = date.toFormat(2)
        currentCatch.setDatum(date)
    }

    function getTime() {
        time = Qt.formatDateTime(new Date(), "h:m ap")
        console.log(time)
        setTime(time)
    }

    function setTime(time) {
        currentCatch.setZeit(time)
    }

    function getGPSPosition() {//TODO
    }

    function getPicture() {}

    signal newRace(string art)
    signal newLength(string laenge)
    signal newWeight(string gewicht)
    signal newOrt(string ort)
    signal newFoto(string url)

    Catch {
        id: currentCatch
        art: ""
        laenge: ""
        gewicht: ""
        ort: ""
        datum: ""
        uhrzeit: ""
        fotoURL: ""
        visible: false
    }

    onNewRace: {
        currentCatch.setArt(art)
        //currentCatch.update()
    }

    onNewLength: {
        currentCatch.setLaenge(laenge)
    }

    onNewWeight: {
        currentCatch.setGewicht(gewicht)
    }

    onNewFoto: {
        currentCatch.setFoto(url)
    }

    function setPictureURL(url) {
        currentCatch.setFoto(url)
    }

    //Background
    Rectangle {
        color: "#00000000"
        anchors.fill: parent
    }

    // Implements back key navigation
    Keys.onReleased: {
        if (event.key === Qt.Key_Back) {
//            if(stackView.depth ==0){
//                tool_bar2.visible = true
//            }

            if (stackView.depth > 1) {
                stackView.pop()
                event.accepted = true
            } else {
                Qt.quit()
            }
        }
    }

    Item {
        id: tool_bar1
        width: parent.width
        height: 0.09375 * parent.height
        z: 10

        ToolBar {
            id: nmae12
            //source: "../FishermansApp/Images/toolbar.png"
            width: mainView.width
            height: parent.height
            // border.left: 0
            //  border.top: 0
            //  border.right: 0
            // border.bottom: 3
        }

        Rectangle {
            id: backButton
            width: opacity ? 60 : 0
            anchors.left: parent.left
            anchors.leftMargin: 20
            opacity: stackView.depth > 1 ? 1 : 0
            anchors.verticalCenter: parent.verticalCenter
            antialiasing: true
            height: 60
            radius: 4
            color: backmouse.pressed ? "#222" : "transparent"
            Behavior on opacity {
                NumberAnimation {
                }
            }
            Image {
                anchors.verticalCenter: parent.verticalCenter
                source: "../FishermansApp/Images/navigation_previous_item.png"
            }
            MouseArea {
                id: backmouse
                anchors.fill: parent
                anchors.margins: -10
                onClicked: stackView.pop()
            }
        }

        Text {
            id: headerText
            anchors.verticalCenter: parent.verticalCenter
            color: "#000000"
            text: "FishermansApp"
            font.pointSize: 23
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.leftMargin: 20
        }
    } // end Header

    ListModel {
        id: pageModel

        ListElement {
            title: "Buttons"
            page: "content/ButtonPage.qml"
        }
    }

    Item {
        id: newCatchRace
        width: parent.width
        height: parent.height
        visible: false
        NewCatchRace {
            width: parent.width
            height: parent.height

            onButtonClicked: {

                stackView.push(newCatchLength)
                newRace(getFish())
            }
        }
    }
    Item {
        id: newCatchLength
        width: parent.width
        height: parent.height
        visible: false
        NewCatchLength {
            width: parent.width
            height: parent.height

            onButtonClicked: {

                stackView.push(newCatchWeight)
                newLength(getLength())
            }
        }
    }

    Item {
        id: newCatchWeight
        width: parent.width
        height: parent.height
        visible: false
        NewCatchWeight {
            width: parent.width
            height: parent.height

            onButtonClicked: {
                stackView.push(newCatchFoto)
                newWeight(getWeight())
            }
        }
    }
    Item {
        id: newCatchFoto
        width: parent.width
        height: parent.height
        visible: false
        NewCatchFoto {
            width: parent.width
            height: parent.height

            onButtonClicked: {
                stackView.push(currentCatch)
                newFoto(getFotoURL())
            }
        }
    }

    //    Item{
    //        id:newCatch
    //        width:parent.width
    //        height: parent.height
    //        visible: false
    //        Catch{
    //            width:parent.width
    //            height: parent.height

    //            onButtonClicked: stackView.push(overView)
    //        }
    //    }
    StackView {
        id: stackView
        y: {
            0.09375 * parent.height
        }
        height: {
            (1 - 0.09375) * parent.height
        }

        initialItem: Item {
            id: overView
            y: 0.09375 * parent.height
            width: parent.width
            height: parent.height - tool_bar1.height
            Overview {
                width: parent.width
                height: parent.height
            }
        }
    }

    Item {
        id: tool_bar2
        x: 29
        y: 76
        width: parent.width
        height: 0.09375 * parent.height
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        z: 10
        ToolBar {
            id: nmae13
            width: mainView.width
            height: parent.height
        }

        Rectangle {
            id: backButton1
            width: opacity ? 60 : 0
            height: 60
            color: backmouse1.pressed ? "#222" : "transparent"
            radius: 4
            anchors.leftMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            antialiasing: true
            opacity: stackView.depth > 1 ? 1 : 0
            anchors.left: parent.left
            Image {
                source: "../FishermansApp/Images/navigation_previous_item.png"
                anchors.verticalCenter: parent.verticalCenter
            }

            MouseArea {
                id: backmouse1
                anchors.margins: -10
                anchors.fill: parent
            }
        }

        Button {
            id: catchbutton1
            x: 180
            y: 3
            width: parent.width / 2
            height: 50
            z: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 3
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                console.log("NEW CATCH CLICKED")
                stackView.push(newCatchRace)
                tool_bar2.visible = false
            }
            text: "NEW CATCH!"
            anchors.horizontalCenterOffset: 90
        }

        Button {
            id: catchbutton2
            x: 0
            y: 3
            width: parent.width / 2
            height: 50
            text: "NEW CATCH!"
            anchors.bottom: parent.bottom
            z: 10
            anchors.horizontalCenterOffset: -90
            anchors.bottomMargin: 3
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }


    //        MouseArea {
    //            id: mainMouse
    //            anchors.fill: parent
    //            anchors.margins: 0
    //            //onClicked: stackView.push(item1)
    //        }
    //        Item{
    //            id: item1
    //            width: parent.width
    //            height: parent.height
    //            ButtonPage{
    //            }
    //        }



    Component.onCompleted: {
        getDate()
        getTime()
    }
}
//    Component.onCompleted: {
//        for (var i = 0; i < 10; i++) {
//            pageModel.append({
//                                 title: "5.95",
//                                 page: "content/TabBarPage.qml"
//                             })
//        }
//    }

