import QtQuick 2.0
import QtQuick.Controls

Item {
    id: root
    height: 30

    signal applyChanges(text: string)

    Row{
        anchors.fill: parent
        anchors.topMargin: 6
        spacing: 6

        MyButton{
            id: flipHorizontallyBtn
            width: (root.width / 2) - 3
            height: root.height

            text: "Flip horizontally"
            onButtonPressed:{
                ImageManagement.flipImage(false);
                applyChanges(flipHorizontallyBtn.text)
            }
        }
        MyButton{
            id: flipVerticallyBtn
            width: (root.width / 2) - 3
            height: root.height

            text: "Flip vertically"
            onButtonPressed:{
                ImageManagement.flipImage(true);
                applyChanges(flipVerticallyBtn.text)
            }
        }
    }
}
