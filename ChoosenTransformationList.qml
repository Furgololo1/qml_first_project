import QtQuick 2.0
import QtQuick.Controls 2.3

Rectangle{
    id: root
    border.width: 1
    border.color: "#000000"
    width: 200
    height: 175

    function appendChoosenTransformationToList(text: string){
        choosenTransformationsModels.append({name: text})
    }

    Component {
        id: listDelegate

        Text {
            text: model.name
            font.pointSize: 15
            width: root.width
            MouseArea{
                anchors.fill: parent

                onClicked:{
                    if(listView.currentIndex === model.index)
                        listView.currentIndex = -1
                    else
                        listView.currentIndex = model.index
                }
            }
        }
    }
    ListModel { id: choosenTransformationsModels }
    TransformationsModels{id: transformationsModels}

    ListView {
        id: listView
        //anchors.fill: parent
        anchors.centerIn: parent
        anchors.margins: 20
        width: parent.width - 4
        height: parent.height - 4
        currentIndex: -1

        model: choosenTransformationsModels
        delegate: listDelegate
        focus: true
        clip: true

        highlightMoveVelocity: -1
        highlight: Rectangle{
            anchors.left: parent.left; anchors.right: parent.right
            color: "pink"
            height: 75

        }
    }
}

