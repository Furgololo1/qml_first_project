import QtQuick 2.0

ListModel {
    id: listModel

    ListElement {
        name: "Change RGB"
        transformations: [
            ListElement{ transform: "Change R value" },
            ListElement{ transform: "Change G value" },
            ListElement{ transform: "Change B value" }
        ]
    }

    ListElement{
        name: "Reset RGB channel"
        transformations:[
            ListElement{ transform: "Reset R value" },
            ListElement{ transform: "Reset G value" },
            ListElement{ transform: "Reset B value" }
        ]
    }

    ListElement{
        name: "Rotation"
        transformations:[
            ListElement{ transform: "90 degrees" },
            ListElement{ transform: "180 degrees" },
            ListElement{ transform: "270 degrees" }
        ]
    }

    ListElement{
        name: "Flip image"
        transformations:[
            ListElement{ transform: "Vertically" },
            ListElement{ transform: "Horizontally" }
        ]
    }

    ListElement{
        name: "Move image"
    }

    ListElement {
        name: "Saturation"
    }

    //            ListElement {
    //                name: "Change RGB value"; section: "ChangeRGB"
    //            }
    //            ListElement {
    //                name: "Reset RGB channel"; section: "ChangeRGB"
    //            }
    //            ListElement {
    //                name: "90 degress"; section: "Rotation"
    //            }
    //            ListElement {
    //                name: "180 degress"; section: "Rotation"
    //            }
    //            ListElement {
    //                name: "270 degress"; section: "Rotation"
    //            }
    //            ListElement {
    //                name: "Vertically"; section: "Flip image"
    //            }
    //            ListElement {
    //                name: "Horizontally"; section: "Flip image"
    //            }
    //            ListElement {
    //                name: "Move image"; section: "Transformations"
    //            }
    //            ListElement {
    //                name: "Saturation"
    //            }

}

