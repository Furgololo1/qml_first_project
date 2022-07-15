import QtQuick 2.0

Rectangle {
    id: root
        border.width: 2
        border.color: "#000000"
        property var window: null
        property bool bIsCurrentlySetWindow: false

        function destroyWindow(){
            bIsCurrentlySetWindow = false
            window.destroy()
        }

        function chooseWindowToDisplay(nameID: int, transformationID){
            if(bIsCurrentlySetWindow === true)
                destroyWindow()

            if(nameID === 0){
                var component = Qt.createComponent("SetRGBValueWindow.qml")
                window = component.createObject(root, {})
                window.anchors.fill = root
                if(transformationID === 0)
                    window.textValue = "Set R value"
                if(transformationID === 1)
                    window.textValue = "Set G value"
                if(transformationID === 2)
                    window.textValue = "Set B value"
            }
        }
}
