import QtQuick 2.0

Item {
    id: root
    property string text: "Arial"
    property var object: null
    z: Infinity

    MyButton{
        id: button
        Connections{
            target: object
            function onCurrentIndexChanged(fontName){
                button.text = fontName
            }
        }

        property bool bHasListView: false
        anchors.fill: root
        text: root.text
        color: "#9F9F9F"
        onButtonPressed: {
            if(bHasListView === false){
                var component = Qt.createComponent("TextSettingsListView.qml")
                object = component.createObject(parent)
                object.x = parent.x
                object.y = parent.y + parent.height
                object.width = parent.width
                bHasListView = true
            }
            else{
                object.destroy()
                bHasListView = false
            }
        }
    }

}
