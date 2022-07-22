import QtQuick 2.0

ListModel {
    id: listModel

    ListElement {
        name: "AlignLeft"
        alignment: Qt.AlignLeft
    }
    ListElement {
        name: "AlignRight"
        alignment: Qt.AlignRight
    }
    ListElement {
        name: "AlignHCenter"
        alignment: Qt.AlignHCenter
    }
    ListElement {
        name: "AlignJustify"
        alignment: Qt.AlignJustify
    }
    ListElement {
        name: "AlignTop"
        alignment: Qt.AlignTop
    }
    ListElement {
        name: "AlignBottom"
        alignment: Qt.AlignBottom
    }
    ListElement {
        name: "AlignVCenter"
        alignment: Qt.AlignVCenter
    }
    ListElement {
        name: "AlignBaseline"
        alignment: Qt.AlignBaseline
    }
    ListElement {
        name: "AlignCenter"
        alignment: Qt.AlignCenter
    }
}

