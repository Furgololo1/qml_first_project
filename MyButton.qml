import QtQuick 2.0

Item {
    id: root
    width: 100
    height: 50

    property color color: "#05C7FF"
    property string text: "Text"
    property string textColor: "#000000"
    property string fontFamily: "Arial"

    signal buttonPressed()

    Rectangle{
        id: borderRect
        anchors.fill: root
        opacity: 1

        Rectangle{
            id: rect
            anchors.fill: parent
            color: root.color
            opacity: 1

            MouseArea{
                id: mouseArea
                anchors.fill: rect
                onClicked: buttonPressed()
                onPressed: rect.opacity = 0.7
                onReleased: rect.opacity = 1
            }
        }
    }

    Text{
        id: displayText
        text: root.text
        font.family: fontFamily
        anchors.centerIn: root
        color: textColor
        opacity: 0.8
        font.bold: true
    }

}
