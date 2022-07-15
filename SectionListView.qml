import QtQuick 2.0

Rectangle {
    id: root
    property int index: 0

    border.width: 1
    border.color: "#000000"
    width: 125
    height: 125

    signal choosenTransformation(transformID: int)
    signal noFocusOnItem()

    Component{
        id: sectionListDelegate

            Text {
                text: model.transform
                font.pointSize: 12
                width: root.width

                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        if(smallListView.currentIndex === model.index){
                            smallListView.currentIndex = -1
                            noFocusOnItem()
                        }
                        else{
                            smallListView.currentIndex = model.index
                            choosenTransformation(model.index)
                        }
                    }
                }
            }
    }

    ListView{
        id: smallListView
        anchors.fill: parent
        anchors.margins: 5
        width: parent.width
        height: parent.height
        //focus: true
        clip: true
        currentIndex: -1

        TransformationsModels{id: listModels}
        model: listModels.get(index).transformations

        delegate: sectionListDelegate

        highlightMoveVelocity: -1
        highlight: Rectangle{
            anchors.left: parent.left; anchors.right: parent.right
            color: "pink"
            height: 25
        }
    }

}
