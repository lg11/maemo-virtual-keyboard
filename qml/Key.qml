import Qt 4.7
import Qt.labs.gestures 1.0

Rectangle {
    id : background
    width : 80
    height : 80
    color : "#00000000"
    property int keycode
    property string keysym

    Rectangle {
        x : 10
        y : 10
        width : parent.width - 10
        height : parent.height - 10
        color : "#30333333"
    }

    Rectangle {
        id : plat
        x : 5
        y : 5
        width : parent.width - 10
        height : parent.height - 10
        color : "#70222222"

        Text {
            text : keysym
            color : "#70FFFFFF"
            font.pointSize: 32; font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.vericalCenter
            y : 10
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
        PropertyChanges { target : plat ; x : 10 ; y : 10 }
    }

    transitions : Transition {
        from : "" ; to : "down" ; reversible : true
        ParallelAnimation {
            NumberAnimation { properties : "x,y" ; duration : 120 }
        }
    }
}
