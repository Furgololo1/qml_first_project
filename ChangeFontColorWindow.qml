import QtQuick 2.0
import QtQuick.Controls 2.3
//import QtQuick.Controls.Material 2.3

Rectangle {
    id: root

    property color previewColor: "#B31548"
    Column{
        spacing: 5

        Text {
            id: colorText
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: "Preview RGBA color"
            width: root.width
            height: 20
            font.bold: true
            font.pointSize: 12
        }
        Rectangle{
            id: previewColorRect
            width: parent.width
            height: 20
            color: previewColor
        }
        Row{
            spacing: 2

            Text {
                id: rText
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignRight
                text: "R:"
                width: (root.width/6) - 14
                height: 30
                font.bold: true
                font.pointSize: 15
            }

            TextField {
                id: rTextField
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                width: (root.width/6) - 2
                height: 30
                placeholderText: ((previewColor.r * 255).toFixed(0))
                font.bold: true
                inputMethodHints: Qt.ImhDigitsOnly
                onTextChanged: previewColor.r = (rTextField.text / 255)
            }

            Text {
                id: gText
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "G:"
                width: (root.width/6) - 2
                height: 30
                font.bold: true
                font.pointSize: 15
            }

            TextField {
                id: gTextField
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                width: (root.width/6) - 2
                height: 30
                placeholderText: ((previewColor.g * 255).toFixed(0))
                font.bold: true
                inputMethodHints: Qt.ImhDigitsOnly
                onTextChanged: previewColor.g = (gTextField.text / 255)
            }
            Text {
                id: bText
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "B:"
                width: (root.width/6)
                height: 30
                font.bold: true
                font.pointSize: 15
            }

            TextField {
                id: bTextField
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                width: (root.width/6) - 2
                height: 30
                placeholderText: ((previewColor.b * 255).toFixed(0))
                font.bold: true
                inputMethodHints: Qt.ImhDigitsOnly
                onTextChanged: previewColor.b = (bTextField.text / 255)
            }
        }
        Text {
            id: transparencyText
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: "Transparency"
            width: root.width
            height: 20
            font.bold: true
            font.pointSize: 12
        }
        Slider{
            id: transparencySlider
            width: parent.width
            height: 20
            from: 0
            value: previewColor.a
            to: 1
            onValueChanged: previewColor.a = transparencySlider.value;

            background: Rectangle {
                x: transparencySlider.leftPadding
                y: transparencySlider.topPadding + transparencySlider.availableHeight / 2 - height / 2
                implicitWidth: 200
                implicitHeight: 2
                width: transparencySlider.availableWidth
                height: 5
                radius: 5
                color: "#AEAEAE"

                Rectangle {
                    width: transparencySlider.visualPosition * parent.width
                    height: parent.height
                    color: "#05C7FF"
                    radius: 2
                }
            }

            handle: Rectangle{
                x: transparencySlider.leftPadding + transparencySlider.visualPosition * (transparencySlider.availableWidth - width)
                y: transparencySlider.topPadding + (transparencySlider.availableHeight / 2) - (height / 2)
                implicitWidth: 15
                implicitHeight: 15
                radius: 13
                color: transparencySlider.pressed ? "#58D9FF" : "#05C7FF"
                border.color: "#AEAEAE"
            }

        }

    }

}
