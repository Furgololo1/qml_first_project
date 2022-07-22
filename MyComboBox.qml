import QtQuick 2.0

Item {
    id: root

    property string text: "Arial"
    property int alignmentIndex: 0
    property var object: null
    property ListModel listModel: null

    MyButton{
        id: button
        Connections{
            target: object
            function onCurrentIndexChanged(index, fontName){
                button.text = fontName
                button.fontFamily = fontName
                alignmentIndex = index
            }
        }

        property bool bHasListView: false
        anchors.fill: root
        text: root.text
        onButtonPressed: {
            if(bHasListView === false){
                var component = Qt.createComponent("TextSettingsListView.qml")
                object = component.createObject(root)
                object.x = parent.x
                object.y = parent.height
                object.width = parent.width
                object.listModel = listModel
                bHasListView = true
            }
            else{
                object.destroy()
                bHasListView = false
            }
        }
    }

}
