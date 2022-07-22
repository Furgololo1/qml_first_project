import QtQuick
import QtQuick.Window 2.15
import QtQuick.Dialogs
import QtQuick.Controls 2.3


Window {
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

    Row{
        id: buttonRow
        spacing: 35
        anchors.margins: 35
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
            id: resetImageButton
            width: 150
            height: 50
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

        anchors.topMargin: 70
        anchors.top: buttonRow.bottom
        x: 100
        //anchors.horizontalCenter: buttonRow.horizontalCenter

        Column{
            id: imageRow
            spacing: 35


            PreviewImage{
                id: baseImage
                width: 300
                height: 300
                altText: qsTr("Base Image")
                z: 0
            }

            PreviewImage{
                id: previewImage
                width: 300
                height: 300
                altText: qsTr("Preview Image")
                z: 0
            }

        }

        Column{
            spacing: 35
            anchors.left: imageRow.right
            anchors.top: imageRow.top
            anchors.leftMargin: 25

            TransformationsList{
                id: transformationList
                anchors.horizontalCenter: parent.horizontalCenter
                // x: 600
                // y: 300
            }

            ChoosenTransformationWindow{
                id: choosenTransfromationWindow
                //  x: 600
                //   y: 550
                width: 300
                height: 200

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
        }
    }

}
