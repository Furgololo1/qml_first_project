import QtQuick 2.0

Rectangle {
    id: root
    //  border.width: 2
    //  border.color: "#000000"

    property var window: null
    property bool bIsCurrentlySetWindow: false
    property int currentNameID: 0
    property int currentTransformationID: 0


    Connections{
        target: window
        function onApplyChanges(text){
            applyChoosenTransformation(text)
        }
    }

    function destroyWindow(){
        bIsCurrentlySetWindow = false
        window.destroy()
    }


    function chooseWindowToDisplay(nameID: int, transformationID){
        if(bIsCurrentlySetWindow === true)
            destroyWindow()

        if(nameID === 0){
            let component = Qt.createComponent("SetRGBValueWindow.qml")
            window = component.createObject(root, {})
            window.anchors.fill = root

            if(transformationID === 0)
                window.textValue = "Change R value"
            else if(transformationID === 1)
                window.textValue = "Change G value"
            else if(transformationID === 2)
                window.textValue = "Change B value"
        }

        else if(nameID === 1){
            let component = Qt.createComponent("ResetRGBValueWindow.qml")
            window = component.createObject(root, {})
            window.anchors.fill = root
        }

        else if(nameID === 2){
            let component = Qt.createComponent("RotationWindow.qml")
            window = component.createObject(root, {})
            window.anchors.fill = root
        }

        else if(nameID === 3){
            let component = Qt.createComponent("FlipImageWindow.qml")
            window = component.createObject(root, {})
            window.anchors.fill = root
        }

        else if(nameID === 5){
            let component = Qt.createComponent("GrayScaleWindow.qml")
            window = component.createObject(root, {})
            window.anchors.fill = root
        }

        bIsCurrentlySetWindow = true
        currentTransformationID = transformationID
        currentNameID = nameID

    }
}
