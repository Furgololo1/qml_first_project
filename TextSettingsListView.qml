import QtQuick 2.0

Rectangle {
    id: root

    border.width: 1
    border.color: "#000000"
    height: 175

    signal currentIndexChanged(fontName: string)

    Component{
        id: sectionListDelegate

        Text {
            id: delegateText
            text: modelData
            font.pointSize: 12
            width: root.width

            MouseArea{
                anchors.fill: parent
                onClicked:{
                    if(listView.currentIndex === model.index){
                        listView.currentIndex = -1
                    }
                    else{
                        listView.currentIndex = model.index
                        currentIndexChanged(delegateText.text)
                    }
                }
            }
        }
    }

    ListView{
        id: listView
        anchors.fill: parent
        anchors.margins: 5
        width: parent.width
        height: parent.height
        clip: true
        currentIndex: -1

        model: Qt.fontFamilies()

        delegate: sectionListDelegate

        highlightMoveVelocity: -1
        highlight: Rectangle{
            anchors.left: parent.left; anchors.right: parent.right
            color: "pink"
            height: 25
        }
    }

}
