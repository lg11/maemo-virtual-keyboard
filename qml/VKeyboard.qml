import Qt 4.7

Rectangle {
    width : 480
    height : 800
    color : "transparent"
    
    MouseArea {
        width : 480
        height : 145
        x : 0
        y : 0
        focus : false
        onReleased : { key.toggle() }
    }
    Rectangle {
        width : 480
        height : 640
        y : 160
        x : -5
        color : "transparent"

        VKey {
            x : 0
            y : 0
            keycode : 11
            keysym : "1"
        }
        VKey {
            x : 1 * 48
            y : 0
            keycode : 12
            keysym : "2"
        }
        VKey {
            x : 2 * 48
            y : 0
            keycode : 13
            keysym : "3"
        }
        VKey {
            x : 3 * 48
            y : 0
            keycode : 14
            keysym : "4"
        }
        VKey {
            x : 4 * 48
            y : 0
            keycode : 15
            keysym : "5"
        }
        VKey {
            x : 5 * 48
            y : 0
            keycode : 16
            keysym : "6"
        }
        VKey {
            x : 6 * 48
            y : 0
            keycode : 17
            keysym : "7"
        }
        VKey {
            x : 7 * 48
            y : 0
            keycode : 18
            keysym : "8"
        }
        VKey {
            x : 8 * 48
            y : 0
            keycode : 19
            keysym : "9"
        }
        VKey {
            x : 9 * 48
            y : 0
            keycode : 10
            keysym : "0"
        }
        VKey {
            x : 0
            y : 80
            keycode : 37
            keysym : "Q"
        }
        VKey {
            x : 1 * 48
            y : 80
            keycode : 43
            keysym : "W"
        }
        VKey {
            x : 2 * 48
            y : 80
            keycode : 25
            keysym : "E"
        }
        VKey {
            x : 3 * 48
            y : 80
            keycode : 38
            keysym : "R"
        }
        VKey {
            x : 4 * 48
            y : 80
            keycode : 40
            keysym : "T"
        }
        VKey {
            x : 5 * 48
            y : 80
            keycode : 45
            keysym : "Y"
        }
        VKey {
            x : 6 * 48
            y : 80
            keycode : 41
            keysym : "U"
        }
        VKey {
            x : 7 * 48
            y : 80
            keycode : 29
            keysym : "I"
        }
        VKey {
            x : 8 * 48
            y : 80
            keycode : 35
            keysym : "O"
        }
        VKey {
            x : 9 * 48
            y : 80
            keycode : 36
            keysym : "P"
        }
        VKey {
            x : 0
            y : 160
            keycode : 21
            keysym : "A"
        }
        VKey {
            x : 1 * 48
            y : 160
            keycode : 39
            keysym : "S"
        }
        VKey {
            x : 2 * 48
            y : 160
            keycode : 24
            keysym : "D"
        }
        VKey {
            x : 3 * 48
            y : 160
            keycode : 26
            keysym : "F"
        }
        VKey {
            x : 4 * 48
            y : 160
            keycode : 27
            keysym : "G"
        }
        VKey {
            x : 5 * 48
            y : 160
            keycode : 28
            keysym : "H"
        }
        VKey {
            x : 6 * 48
            y : 160
            keycode : 30
            keysym : "J"
        }
        VKey {
            x : 7 * 48
            y : 160
            keycode : 31
            keysym : "K"
        }
        VKey {
            x : 8 * 48
            y : 160
            keycode : 32
            keysym : "L"
        }
        VKey {
            x : 9 * 48
            y : 160
            keycode : 53
            keysym : ""
        }
        VKey {
            x : 0
            y : 240
            keycode : 0
            keysym : ""
        }
        VKey {
            x : 1 * 48
            y : 240
            keycode : 46
            keysym : "Z"
        }
        VKey {
            x : 2 * 48
            y : 240
            keycode : 44
            keysym : "X"
        }
        VKey {
            x : 3 * 48
            y : 240
            keycode : 23
            keysym : "C"
        }
        VKey {
            x : 4 * 48
            y : 240
            keycode : 42
            keysym : "V"
        }
        VKey {
            x : 5 * 48
            y : 240
            keycode : 22
            keysym : "B"
        }
        VKey {
            x : 6 * 48
            y : 240
            keycode : 34
            keysym : "N"
        }
        VKey {
            x : 7 * 48
            y : 240
            keycode : 33
            keysym : "M"
        }
        VKey {
            x : 8 * 48
            y : 240
            keycode : 56
            keysym : "▲"
        }
        VKey {
            x : 9 * 48
            y : 240
            keycode : 52
            keysym : ""
        }
        VKey {
            x : 0
            y : 320
            keycode : 0
            keysym : ""
        }
        VKey {
            x : 1 * 48
            y : 320
            keycode : 0
            keysym : ""
        }
        VKey {
            x : 2 * 48
            y : 320
            keycode : 0
            keysym : ""
        }
        VKey {
            x : 3 * 48
            y : 320
            width : 192
            keycode : 51
            keysym : "space"
        }
        VKey {
            x : 7 * 48
            y : 320
            keycode : 58
            keysym : "◄"
        }
        VKey {
            x : 8 * 48
            y : 320
            keycode : 57
            keysym : "▼"
        }
        VKey {
            x : 9 * 48
            y : 320
            keycode : 59
            keysym : "►"
        }
    }
}
