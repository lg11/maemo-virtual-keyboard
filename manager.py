#-!- coding=utf-8 -!-

from PySide import QtCore
from PySide import QtGui

from controlor import Controlor
from keyboard import Keyboard

class Manager( QtCore.QObject ) :
    def __init__( self ) :
        QtCore.QObject .__init__( self )
        self.keyboard = None
        self.vkeyboard = None
        self.controlor = Controlor()

        self.controlor.longpressed.connect( self.controlor.close )
        self.controlor.clicked.connect( self.toggle_keyboard )
        #self.controlor.setAttribute( QtCore.Qt.WA_Maemo5AutoOrientation, True )
        #self.desktop = QtGui.QDesktopWidget()
        #self.desktop.resized.connect( self.remap_layout )
        self.is_show = False

        self.remap_layout()
    def create_keyboard( self ) :
        self.keyboard = Keyboard( "qml/Keyboard.qml" )
        self.keyboard.toggled.connect( self.toggle_keyboard )
        #self.keyboard.resize( 800, 480 )
        #self.keyboard.view.resize( 800, 480 )
        self.controlor.longpressed.connect( self.keyboard.close )
    def create_vkeyboard( self ) :
        self.vkeyboard = Keyboard( "qml/VKeyboard.qml" )
        self.vkeyboard.toggled.connect( self.toggle_keyboard )
        #self.vkeyboard.resize( 480, 800 )
        #self.vkeyboard.view.resize( 480, 800 )
        self.controlor.longpressed.connect( self.vkeyboard.close )
    QtCore.Slot()
    def toggle_keyboard( self ) :
        self.is_show = not self.is_show
        self.remap_layout()
    QtCore.Slot( int )
    def remap_layout( self, flag = 0 ) :
        #print "remap"
        if self.keyboard :
            self.keyboard.hide()
        if self.vkeyboard :
            self.vkeyboard.hide()
        self.controlor.hide()
        desktop = QtGui.QDesktopWidget()
        is_v = False
        if desktop.width() < desktop.height() :
            is_v = True
        if not self.is_show :
            if is_v :
                #self.controlor.move( 720 * 480 / 800 , 335 * 800 / 480)
                self.controlor.move( 15, 335 )
            else :
                #self.controlor.move( 720, 335 )
                self.controlor.move( 15, 335 )
            self.controlor.show()
        else :
            if is_v :
                #self.vkeyboard.resize( 480, 800 )
                #self.vkeyboard.view.resize( 480, 800 )
                #self.vkeyboard.move( 0, 0 )
                if not self.vkeyboard :
                    self.create_vkeyboard()
                self.vkeyboard.show()
            else :
                #self.keyboard.resize( 480, 800 )
                #self.keyboard.view.resize( 800, 480 )
                #self.keyboard.move( 0, 0 )
                if not self.keyboard :
                    self.create_keyboard()
                self.keyboard.show()

if __name__ == "__main__" :
    import sys
    app = QtGui.QApplication( sys.argv )

    mgr = Manager()
    #mgr.controlor.longpressed.connect( app.exec_ )

    sys.exit( app.exec_() )
