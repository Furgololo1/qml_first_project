import QtQuick 2.0

Rectangle {
    id: root
    width: 300
    height: 200
    z: 1

    signal reloadTransformatedImage()

    function applyChoosenTransformation(text){
        reloadTransformatedImage()
        list.appendChoosenTransformationToList(text)
    }

    function displayValueWindow(nameID: int, transformID: int){
        changeValueWindow.chooseWindowToDisplay(nameID, transformID)
    }

    function destroyCurrentValueWindow(){
        changeValueWindow.destroyWindow()
    }

    function clearListModels(){
        list.removeFromModel(-1, true)
    }

    ChoosenTransformationList{
        id: list
        anchors.fill: root

        Text {
            id: altText
            text: "Choosen transformations"
            anchors.horizontalCenter: parent.horizontalCenter
            font.bold: true
            font.pointSize: 18
            y: -40
        }

        Row{
            id: row
            anchors.left: list.left
            anchors.top: list.bottom
            anchors.topMargin: 6
            spacing: 6

            MyButton{
                id: removeBtn
                width: (list.width / 2) - 3
                height: 30
                color: "#FF0136"
                text: "Remove selected item"
                onButtonPressed:{
                    console.log("remove smth")
                    list.removeFromModel(list.indexToRemove, false)
                    ImageManagement.remove(list.indexToRemove)
                    reloadTransformatedImage()
                }
            }

            MyButton{
                id: duplicateBtn
                width: (list.width / 2) - 3
                height: 30
                color: "#C7C7C7"
                text: "Duplicate selected item"
                onButtonPressed:{
                    console.log("duplicate smth")
                    ImageManagement.duplicate(list.indexToRemove)
                    list.appendChoosenTransformationToListDuplicate()
                    reloadTransformatedImage()
                }
            }
        }
        ChangeValueWindow{
            id: changeValueWindow
            width: row.width
            height: 50
            anchors.left: row.left
            anchors.top: row.bottom
            anchors.topMargin: 6
            z: 1
        }
    }
}
