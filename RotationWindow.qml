import QtQuick 2.0
import QtQuick.Controls

Item {
    id: root
    height: 30

    property string transformName: ""
    property int angle: 0
    //signal rotateImage(angle: int)
    signal applyChanges(text: string)

    Text{
        id: informationText
        anchors.fill: parent
        text: "Rotate image"
        font.pointSize: 15
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    Row{
        anchors.left: root.left
        anchors.top: root.bottom
        anchors.topMargin: 6
        spacing: 6

        Rectangle{
            width: (root.width / 2) - 3
            height: root.height

            Column{
                spacing: 1
                RadioButton{
                    id: rB0
                    text: qsTr("Rotate 90 degrees")
                    onClicked:{
                        angle = 90
                        transformName = rB0.text
                    }
                }
                RadioButton{
                    id: rB1
                    text: qsTr("Rotate 180 degrees")
                    onClicked:{
                        angle = 180
                        transformName = rB1.text
                    }
                }
                RadioButton{
                    id: rB2
                    text: qsTr("Rotate 270 degrees")
                    onClicked:{
                        angle = 270
                        transformName = rB2.text
                    }
                }
            }

        }

        MyButton{
            id: applyBtn
            width: (root.width / 2) - 3
            height: root.height
            text: "Apply changes"

            onButtonPressed: {
                ImageManagement.rotateImage(angle)
                applyChanges(transformName)
            }
        }
    }
}
