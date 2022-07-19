import QtQuick 2.0

Item {
    id: root

    property string filePath: ""
    property string altText: "Alt Text"
    property int rectOpacity: 1

    function changeAltText(newText){
        altText.text = newText
    }

    function loadNewImage(fileToOpen){
        baseImage.source = fileToOpen
        filePath = fileToOpen
        rectOpacity = 0
    }

    Image {
        id: baseImage
        anchors.fill: root
        source: filePath

        Text {
            id: altText
            text: root.altText
            anchors.horizontalCenter: baseImage.horizontalCenter
            font.bold: true
            font.pointSize: 20
            y: -40
        }

    }

    Rectangle{
        id: rect
        anchors.fill: root
        border.color: "#000000"
        border.width: 2
        opacity: rectOpacity
    }
}
