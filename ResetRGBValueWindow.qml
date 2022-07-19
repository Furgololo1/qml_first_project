import QtQuick 2.0
import QtQuick.Controls

Item {
    id: root
    height: 30

    property int channel: 0
    property string transformName: ""
    signal applyChanges(text: string)

    Text{
        id: informationText
        anchors.fill: parent
        text: "Reset RGB value"
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
                    checked: true
                    text: qsTr("Reset R channel")
                    onClicked:{
                        channel = 0
                        transformName = rB0.text
                    }
                }
                RadioButton{
                    id: rB1
                    text: qsTr("Reset G channel")
                    onClicked:{
                        channel = 1
                        transformName = rB1.text
                    }
                }
                RadioButton{
                    id: rB2
                    text: qsTr("Reset B channel")
                    onClicked:{
                        channel = 2
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
                if(channel === 0)
                    ImageManagement.resetRValue()
                else if(channel === 1)
                    ImageManagement.resetGValue()
                else if(channel === 2)
                    ImageManagement.resetBValue()

                applyChanges(transformName)
            }

        }

    }


}
