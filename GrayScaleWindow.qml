import QtQuick 2.0
import QtQuick.Controls

Item {
    id: root
    height: 30

    signal applyChanges(text: string)

    MyButton{
        id: grayScaleBtn
        width: (root.width / 2) - 3
        height: root.height

        text: "Apply gray scale"
        onButtonPressed:{
            ImageManagement.grayScale();
            applyChanges(grayScaleBtn.text)
        }
    }
}
