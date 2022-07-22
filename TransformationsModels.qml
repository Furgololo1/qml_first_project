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
    }

    ListElement{
        name: "Rotation"
        bHasArray: false
    }

    ListElement{
        name: "Flip image"
        bHasArray: false
    }

    ListElement{
        name: "Draw text on image"
        bHasArray: false
    }

    ListElement {
        name: "Gray scale"
        bHasArray: false
    }

}

