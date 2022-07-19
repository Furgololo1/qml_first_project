import QtQuick 2.0

ListModel {
    id: listModel

    ListElement {
        name: "Change RGB"
        bHasArray: true
        transformations: [
            ListElement{ transform: "Change R value" },
            ListElement{ transform: "Change G value" },
            ListElement{ transform: "Change B value" }
        ]
    }

    ListElement{
        name: "Reset RGB channel"
        bHasArray: false
        transformations:[
            ListElement{ transform: "Reset R " },
            ListElement{ transform: "Reset G " },
            ListElement{ transform: "Reset B " }
        ]
    }

    ListElement{
        name: "Rotation"
        bHasArray: false
        transformations:[
            ListElement{ transform: "Rotated image 90 degrees" },
            ListElement{ transform: "Rotated image 180 degrees" },
            ListElement{ transform: "Rotated image 270 degrees" }
        ]
    }

    ListElement{
        name: "Flip image"
        bHasArray: false
        transformations:[
            ListElement{ transform: "Flipped image vertically" },
            ListElement{ transform: "Flipped image horizontally" }
        ]
    }

    ListElement{
        name: "Draw text on image"
        bHasArray: true
        transformations:[
            ListElement{ transform: "Font" },
            ListElement{ transform: "Font color" },
            ListElement{ transform: "Text layout" }
        ]
    }

    ListElement {
        name: "Gray scale"
        bHasArray: false
    }

}

