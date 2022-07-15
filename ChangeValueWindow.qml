import QtQuick 2.0

Rectangle {
    id: root
    //  border.width: 2
    //  border.color: "#000000"

    property var window: null
    property bool bIsCurrentlySetWindow: false
    property int currentNameID: 0
    property int currentTransformationID: 0

//    signal applyImageTransformation(nameID: int, transformID: int)

    Connections{
        target: window
        function onSetRGBValue(newValue){
            if(currentTransformationID === 0)
                ImageManagement.changeR(newValue)
            else if(currentTransformationID === 1)
                ImageManagement.changeG(newValue)
            else if(currentTransformationID === 2)
                ImageManagement.changeB(newValue)

            applyChoosenTransformation(currentNameID, currentTransformationID, newValue)
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
                window.textValue = "Set R value"
            else if(transformationID === 1)
                window.textValue = "Set G value"
            else if(transformationID === 2)
                window.textValue = "Set B value"
        }

        else if(nameID === 1){
            let component = Qt.createComponent("ResetRGBValueWindow.qml")
            window = component.createObject(root, {})
            window.anchors.fill = root
            if(transformationID === 0)
                window.textValue = "Reset R value"
            else if(transformationID === 1)
                window.textValue = "Reset G value"
            else if(transformationID === 2)
                window.textValue = "Reset B value"
        }

        bIsCurrentlySetWindow = true
        currentTransformationID = transformationID
        currentNameID = nameID

    }
}
