import QtQuick 2.0
import QtQuick.Controls 1.0
import QtMultimedia 5.0

Item {
    id: root

    width: parent.width
    height: parent.height

    signal buttonClicked

    property string fotoURL: ""

    function setFotoURL(url){
        fotoURL = url
    }

    function getFotoURL(){
        return fotoURL
    }

    Item {
        id: tool_bar2
        x: 0
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
                console.log("Foto aufnehmen")

                //tool_bar2.visible = false

                buttonClicked()
            }
            buttonText: "Foto aufnehmen"
            anchors.horizontalCenterOffset: 0
        }
    }

    VideoOutput {

        source: camera
        focus: visible // to receive focus and capture key events when visible
        anchors.fill: parent

        MouseArea {
            anchors.fill: parent
            onClicked: {
                camera.imageCapture.capture()

                //TODO
                // stop the capturing again
                //camera.imageCapture.cancelCapture()
                // fotoURL = camera.
            }
        }
    }

    Image {
        id: photoPreview
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    Camera {
        id: camera

        //focus : visible // to receive focus and capture key events when visible
        imageCapture {

            onImageCaptured: {
                // Show the preview in an Image
                photoPreview.source = preview
                console.debug("Captured Image:" + preview)
                preview.source = preview
                setFotoURL(preview)


            }
            onImageSaved: {
                console.log("Image saved:" + path)
                 //setFotoURL(camera.capturedImagePath)
            }

        }
    }

    Component.onCompleted: camera.stop()
}
