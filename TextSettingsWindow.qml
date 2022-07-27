import QtQuick 2.0
import QtQuick.Controls 2.3

Item {
    id: root

    signal applyChanges(text: string)

    Item{
        id: item
        width: root.width

        Column{
            id: column
            anchors.fill: root
            spacing: 5

            MyComboBox{
                id: fontComboBox
                width: parent.width
                height: 30
                text: "Arial"
                z: 3
            }

            Rectangle{
                width: root.width
                anchors.horizontalCenter: parent.horizontalCenter
                height: 2
                radius: 1
                opacity: 0.6
                color: "#595959"
            }

            Row{
                spacing: 5
                z: 2
                Text {
                    id: altText
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: "Type font size"
                    width: 90
                    height: 30
                    font.bold: true
                    font.pointSize: 10
                }

                TextField {
                    id: fontSizeTextField
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    width: 25
                    height: 30
                    placeholderText: (10)
                    font.bold: true
                    inputMethodHints: Qt.ImhDigitsOnly
                }
                TextField {
                    id: textTextField
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    width: 175
                    height: 30
                    placeholderText: qsTr("Type text here...")
                    font.bold: true
                }
            }

            Rectangle{
                width: root.width
                anchors.horizontalCenter: parent.horizontalCenter
                height: 2
                radius: 1
                opacity: 0.6
                color: "#595959"
            }

            MyComboBox{
                id: alignComboBox
                width: parent.width
                height: 30
                text: "AlignLeft"
                listModel: AlignmentModels{}
                z: 2
            }

            Rectangle{
                width: root.width
                anchors.horizontalCenter: parent.horizontalCenter
                height: 2
                radius: 1
                opacity: 0.6
                color: "#595959"
            }
        }

        Item{
            width: root.width
            anchors.left: item.right
            anchors.top: parent.top
            anchors.topMargin: -30
            anchors.leftMargin: 35

            ChangeFontColorWindow{
                id: changeFontColor
                anchors.top: parent.top
                width: parent.width
                height: 130
            }

            MyButton{
                id: applyBtn
                anchors.top: changeFontColor.bottom
                width: parent.width
                height: 30
                AlignmentModels{id: alignmentList}

                text: "Apply changes"
                onButtonPressed:{
                    ImageManagement.drawTextOnImage(changeFontColor.previewColor, fontComboBox.text, fontSizeTextField.text,
                                                    alignmentList.get(alignComboBox.alignmentIndex).alignment, textTextField.text);

                    applyChanges("Draw text on image")
                }
            }
        }

    }

}
