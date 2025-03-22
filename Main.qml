import QtQuick
import QtQuick.Controls.iOS
import QtQuick.Layouts

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    ColumnLayout {

        anchors.centerIn: parent

        Rectangle {

            color: "dodgerblue"
            width: 300
            height: 200

            RowLayout {

                anchors.centerIn: parent
                //anchors.fill: parent

                Repeater {
                    id: repeater
                    model: [{duration: 600, height: 150}, {duration: 800, height: 50}
                        , {duration: 1000, height: 100}, {duration: 1200, height: 40}
                        , {duration: 1400, height: 20}, {duration: 1600, height: 120}
                    , {duration: 1800, height: 40}, {duration: 2000, height: 30}]

                    RoundedLine {

                        required property int index
                        required property var modelData

                        id: line
                        //objectName: modelData.id
                        recHeight: modelData.height
                        Component.onCompleted: {
                            console.log(modelData.duration)
                            //anim.start()
                        }

                        property alias anim: anim

                        PropertyAnimation {
                            id: anim
                            target: line
                            property: "color"
                            to: "red"
                            duration: modelData.duration
                        }
                    }
                }
            }
        }

        Button {
            text: "start"
            Layout.alignment: Qt.AlignHCenter
            onClicked: {
                for (let i = 0; i < repeater.count; i++) {
                    let item = repeater.itemAt(i); // Get each RoundedLine
                    if (item) {
                        item.anim.start(); // ✅ Access and start animation
                    }
                }
            }
        }

        Button {
            text: "Reset Animations"
            Layout.alignment: Qt.AlignHCenter
            anchors.margins: 50
            onClicked: {
                for (let i = 0; i < repeater.count; i++) {
                    let item = repeater.itemAt(i);
                    if (item) {
                        item.anim.stop(); // ✅ Stop animation
                        item.color = "darkgrey"; // ✅ Reset color
                    }
                }
            }
        }
    }
}
