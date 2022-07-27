import QtQuick
import QtQuick.Window 2.15
import QtQuick.Dialogs
import QtQuick.Controls 2.3


Window {
    id: window
    width: 800
    height: 930
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

    property real btnWidth: window.width/4


    Item{
        id: buttonItem
        width: parent.width - 70
        height: 50
        anchors.margins: 35
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter


        MyButton{
            id: loadImageButton
            anchors.left: parent.left
            width: btnWidth
            height: parent.height
            text: "Load image"
            onButtonPressed:{
                ImageManagement.openFileDialog();
                baseImage.loadNewImage("image://imageProvider/foo")
                previewImage.loadNewImage("image://imageProvider/foo")
            }
        }

        MyButton{
            id: saveImageButton
            anchors.horizontalCenter: parent.horizontalCenter
            width: btnWidth
            height: parent.height
            text: "Save image"
            onButtonPressed:{
                ImageManagement.saveImage()
            }
        }

        MyButton{
            id: resetImageButton
            anchors.right: parent.right
            width: btnWidth
            height: parent.height
            text: "Reset"
            onButtonPressed:{
                baseImage.loadNewImage("")
                previewImage.loadNewImage("")
                choosenTransfromationWindow.clearListModels()
                ImageManagement.clearAll();
            }
        }
    }

    Item{

        height: 300

        width: window.width - 70
        anchors.top: buttonItem.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 35


        ChoosenTransformationWindow{
            id: choosenTransfromationWindow

            anchors.right: parent.horizontalCenter
            anchors.rightMargin: 35

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

        TransformationsList{
            id: transformationList
            anchors.left: parent.horizontalCenter
            anchors.leftMargin: 35
        }

    }

    Item{
        width: parent.width - 70
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 35

        PreviewImage{
            id: baseImage
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            width: 300
            height: 300
            altText: qsTr("Base Image")
            z: 0
        }

        PreviewImage{
            id: previewImage
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            width: 300
            height: 300
            altText: qsTr("Preview Image")
            z: 0
        }

    }


}
