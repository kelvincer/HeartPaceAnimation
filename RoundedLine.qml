import QtQuick

Rectangle {

    property int recHeight: 20
    property string recColor: "darkgrey"
    property int recY: 0
    property int recX: 0

    width: 20
    y: recY
    x: recX
    height: recHeight
    color: recColor
    bottomLeftRadius: 10
    bottomRightRadius: 10
    topLeftRadius: 10
    topRightRadius: 10
}



