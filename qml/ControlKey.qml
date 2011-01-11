import Qt 4.7
import Qt.labs.gestures 1.0

Rectangle {
    id : key
    width : 65
    height : 65
    color : "#00000000"

    Rectangle {
        x : 10
        y : 10
        width : 55
        height : 55
        color : "#30333333"
    }

    Rectangle {
        id : plat
        x : 5
        y : 5
        width : 55
        height : 55
        color : "#80222222"
    }

    MouseArea {
        id : mouseArea
        focus : false
        anchors.fill : parent
        onPressed : { con.press() }
        onReleased : { con.release() }
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
