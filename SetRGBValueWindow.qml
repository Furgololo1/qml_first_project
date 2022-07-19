import QtQuick 2.0

Item {
    id: root
    height: 30

    property string textValue: "Change RGB value"

    //signal setRGBValue(newValue: int)
    signal applyChanges(text: string)

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
                text: "0"
                font.pointSize: 15
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        MyButton{
            id: applyBtn
            width: (root.width / 2) - 3
            height: root.height

            text: "Apply changes"

            onButtonPressed: {
                if(textValue === "Change R value")
                    ImageManagement.changeR(textInput.text)
                else if(textValue === "Change G value")
                    ImageManagement.changeG(textInput.text)
                else if(textValue === "Change B value")
                    ImageManagement.changeB(textInput.text)

                applyChanges(textValue + " (" + textInput.text + ")")
            }
        }
    }
}
