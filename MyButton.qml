import QtQuick 2.0

Item {
    id: root
    width: 100
    height: 50

    property color color: "#059FEB"
    property color colorHovered: "#059FEB"
    property color colorClicked: "#059FEB"
    property string text: "Text"

    signal buttonPressed()

    Rectangle{
        id: borderRect
        anchors.fill: root
        opacity: 1

        Rectangle{
            id: rect
            anchors.fill: parent
            color: root.color
            opacity: 0.5

            MouseArea{
                id: mouseArea
                anchors.fill: rect
                onClicked: buttonPressed()
                onPressed: rect.opacity = 0.35
                onReleased: rect.opacity = 0.5
            }
        }
    }

    Text{
        id: displayText
        text: root.text
        anchors.centerIn: root
        color: "#000000"
        opacity: 0.8
        font.bold: true
    }

}
