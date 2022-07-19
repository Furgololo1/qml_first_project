import QtQuick
import QtQuick.Window 2.15
import QtQuick.Dialogs
import QtQuick.Controls 2.3


Window {
    width: 1200
    height: 1000
    visible: true
    title: qsTr("First Project QML")

    Connections{
        property bool counter: true
        target: choosenTransfromationWindow
        function onReloadTransformatedImage(){
            counter = !counter
            previewImage.loadNewImage("image://imageProvider/transform" + counter)
        }
    }


    TextSettingsWindow{
        x: 100
        y: 300
        width: 200
        height: 30
    }


    MyButton{
        id: testBtn
        width: 150
        height: 50
        text: "Blur"
        onButtonPressed:{
            ImageManagement.test();
            previewImage.loadNewImage("image://imageProvider/asdohsdlasbgd")
        }
    }

    TransformationsList{
        id: transformationList
        x: 200
        y: 100
    }

    ChoosenTransformationWindow{
        id: choosenTransfromationWindow
        x: 600
        y: 100
        width: 300
        height: 300

        Connections{
            target: transformationList
            function onChooseTransformationsID(nameID, transformID){
                choosenTransfromationWindow.displayValueWindow(nameID, transformID)
            }

            function onDestroyCurrentValueWindow(){
                choosenTransfromationWindow.destroyCurrentValueWindow()
            }
        }
    }


    Row{
        spacing: 25
        anchors.margins: 25
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter

        MyButton{
            id: loadImageButton
            width: 150
            height: 50
            text: "Load image"
            onButtonPressed:{
                ImageManagement.openFileDialog();
                baseImage.loadNewImage("image://imageProvider/foo")
                previewImage.loadNewImage("image://imageProvider/foo")
            }
        }

        MyButton{
            id: saveImageButton
            width: 150
            height: 50
            text: "Save image"
            onButtonPressed:{
                ImageManagement.saveImage()
            }
        }

        MyButton{
            id: uploadImageButton
            width: 150
            height: 50
            text: "Upload image"
            onButtonPressed:{
                previewImage.loadNewImage("image://imageProvider/red")
            }
        }
    }

    Row{
        spacing: 25
        anchors.margins: 25
        anchors.left: parent.left
        anchors.bottom: parent.bottom

        PreviewImage{
            id: baseImage
            width: 300
            height: 300
            altText: qsTr("Base Image")
        }

        PreviewImage{
            id: previewImage
            width: 300
            height: 300
            altText: qsTr("Preview Image")
        }

    }

}
