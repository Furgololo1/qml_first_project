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
            previewImage.loadNewImage("image://imageProvider/foo" + counter)
            counter = !counter
        }
        // target: transformationList
        //  function onChooseTransformationsID(nameID, transformID){
        //     console.log(listModels.get(nameID).name + " choosen transform " + listModels.get(nameID).transformations.get(transformID).transform)
        // }

        //  target: ImageManagement
        //  function onGetChoosenFile(data){
        //    baseImage.loadNewImage("file:///" + data)
        //previewImage.loadNewImage("image://imageProvider/" + data)
        //    previewImage.loadNewImage("image://imageProvider/foo")
        // }
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

    TransformationsModels{id: listModels}

//    Button{
//        id: resetButton
//        x:0
//        y:0
//        width: 150
//        height: 50
//        text: "resetButton"
//        MouseArea{
//            id: mouseArearesetButton
//            anchors.fill: parent
//            onClicked: {
//                //    baseImage.loadNewImage("image://imageProvider/foo2")
//                previewImage.loadNewImage("image://imageProvider/foo123456")
//            }
//        }
//    }


    Row{
        spacing: 25
        anchors.margins: 25
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter

        Button{
            id: loadImageButton
            width: 150
            height: 50
            text: "Load image"
            MouseArea{
                id: mouseAreaLoadbtn
                anchors.fill: parent
                onClicked: {
                    ImageManagement.openFileDialog();
                    baseImage.loadNewImage("image://imageProvider/foo")
                    previewImage.loadNewImage("image://imageProvider/foo")
                }
            }
        }

        Button{
            id: saveImageButton
            width: 150
            height: 50
            text: "Save image"
            MouseArea{
                id: mouseAreaSavebtn
                anchors.fill: parent
                onClicked: ImageManagement.saveFile(previewImage.filePath);
            }
        }

        Button{
            id: uploadImageButton
            width: 150
            height: 50
            text: "Upload image"
            MouseArea{
                id: mouseAreaUploadbtn
                anchors.fill: parent
                onClicked: previewImage.loadNewImage("image://imageProvider/red")
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
