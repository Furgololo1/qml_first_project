import QtQuick 2.0

Item {
    id: root
    height: 30

    property string textValue: "Reset RGB value"
    property int defaultValue: 0

    Text{
        id: informationText
        anchors.fill: parent
        text: textValue
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
                border.width: 2
                border.color: "#000000"
                TextInput{
                    id: textInput
                    anchors.fill: parent
                    focus: true
                    text: defaultValue
                    font.pointSize: 15
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Button{
                id: applyBtn
                width: (root.width / 2) - 3
                height: root.height

                text: "Apply changes"

                MouseArea{
                    id: mouseAreaApplyBtn
                    anchors.fill: parent
                    onClicked:{
                        console.log("apply changes")
                    }
                }
            }

        }


}
