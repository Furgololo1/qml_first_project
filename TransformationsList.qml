import QtQuick 2.0
import QtQuick.Controls 2.3

Rectangle{
    id: root
    border.width: 2
    border.color: "#000000"
    width: 200
    height: 175
    property var object: null

    signal chooseTransformationsID(transformationNameID: int, transformationID: int)
    signal destroyCurrentValueWindow()

    Connections{
        target: object
        function onChoosenTransformation(id){
            chooseTransformationsID(listView.currentIndex, id)
        }
        function onNoFocusOnItem(){
            destroyCurrentValueWindow()
        }
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

                    if(listView.currentIndex === model.index){
                        if(listView.currentIndex !== -1)
                            listView.destroyObject()
                    }
                    else{
                        listView.currentIndex = model.index
                    }
                }
            }
        }
    }

    ListView {
        id: listView
        //anchors.fill: parent
        anchors.centerIn: parent
        anchors.margins: 20
        width: parent.width - 4
        height: parent.height - 4

        property bool bIsSomeSectionListView: false
        currentIndex: -1


        model: TransformationsModels{}
        delegate: listDelegate
        // focus: true
        interactive: false

        highlightMoveVelocity: -1
        highlight: Rectangle{
            anchors.left: parent.left; anchors.right: parent.right
            color: "pink"
            height: 75

        }

        onCurrentIndexChanged: {
            if(currentIndex === -1) return

            if(bIsSomeSectionListView === true){
                object.destroy()
                bIsSomeSectionListView = false;
            }
            if(model.get(currentIndex).bHasArray === false){
                chooseTransformationsID(currentIndex, -1)
//                return
            }
            else{
                var component = Qt.createComponent("SectionListView.qml")
                object = component.createObject(listView, {index: currentIndex})
                object.x = listView.width + 2
                object.y = listView.currentItem.y
                object.index = currentIndex
                bIsSomeSectionListView = true;
            }
        }

        function destroyObject(){
            if(bIsSomeSectionListView === true)
                object.destroy()
            destroyCurrentValueWindow()
            bIsSomeSectionListView = false
            currentIndex = -1
        }

    }

}
