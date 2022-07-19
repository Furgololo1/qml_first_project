import QtQuick 2.0
import QtQuick.Controls 2.3

Item {
    id: root

    signal applyChanges(text: string)
    Column{
        id: column
        anchors.fill: root
        spacing: 5

        MyComboBox{
            id: comboBox
            width: parent.width
            height: 30
            text: "Arial"
        }

        Row{
            spacing: 5

            Text {
                id: altText
                text: "Type font size"
                width: 170
                height: 30
                font.bold: true
                font.pointSize: 10
                z: 1
            }

            TextField {
                id: fontSizeTextField
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter

                width: 25
                height: 30

                placeholderText: qsTr("10")

                font.bold: true

                inputMethodHints: Qt.ImhDigitsOnly
            }
        }
    }



    //        MyButton{
    //            id: applyBtn
    //            width: (root.width / 2) - 3
    //            height: root.height

    //            text: "Apply changes"
    //            onButtonPressed:{
    //                ImageManagement.test(true);
    //                applyChanges("Draw text on image")
    //            }
    //        }
    //    }
}
