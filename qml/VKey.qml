import Qt 4.7
import Qt.labs.gestures 1.0

Rectangle {
    id : background
    width : 48
    height : 80
    color : "#00000000"
    property int keycode
    property string keysym

    Rectangle {
        x : 6
        y : 6
        width : parent.width - 6
        height : parent.height - 6
        color : "#30333333"
    }

    Rectangle {
        id : plat
        x : 3
        y : 3
        width : parent.width - 6
        height : parent.height - 6
        color : "#70222222"

        Text {
            id : code
            text : keysym
            color : "#70FFFFFF"
            font.pointSize: 20; font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.vericalCenter
            y : 20
        }
    }

    MouseArea {
        id : mouseArea
        focus : false
        anchors.fill : parent
        onPressed : { key.press( keycode ) }
        onReleased : { key.release( keycode ) }
    }

    states : State {
        name : "down" ; when : mouseArea.pressed == true
        PropertyChanges { target : plat ; x : 6 ; y : 6 }
    }

    transitions : Transition {
        from : "" ; to : "down" ; reversible : true
        ParallelAnimation {
            NumberAnimation { properties : "x,y" ; duration : 120 }
        }
    }
}
