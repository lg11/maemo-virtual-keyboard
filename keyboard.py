#-!- coding=utf-8 -!-

from PySide import QtCore, QtGui, QtDeclarative
import vk

class Keyboard( QtGui.QWidget ) :
    toggled = QtCore.Signal()
    def __init__( self, source, parent = None ) :
        #QtGui.QWidget.__init__( self,  parent, QtCore.Qt.X11BypassWindowManagerHint | QtCore.Qt.WindowStaysOnTopHint | QtCore.Qt.Popup )
        QtGui.QWidget.__init__( self,  parent, QtCore.Qt.X11BypassWindowManagerHint | QtCore.Qt.WindowStaysOnTopHint )
        #QtGui.QWidget.__init__( self,  parent, QtCore.Qt.Popup )

        self.setAttribute( QtCore.Qt.WA_TranslucentBackground, True )

        palette = QtGui.QPalette()
        palette.setColor( QtGui.QPalette.Base, QtCore.Qt.transparent )

        self.view = QtDeclarative.QDeclarativeView( self )
        self.view.setAttribute( QtCore.Qt.WA_TranslucentBackground, True )
        self.view.setPalette( palette )
        self.view.setSource( source )

        context = self.view.rootContext()
        context.setContextProperty( "key", self )

        self.setFocusPolicy( QtCore.Qt.NoFocus )
        self.view.setFocusPolicy( QtCore.Qt.NoFocus )

        self.timer = QtCore.QTimer()
        self.timer.timeout.connect( self.timeout )
    @QtCore.Slot()
    def timeout( self ) :
        self.timer.stop()
    @QtCore.Slot( int )
    def press( self, keycode ) :
        if keycode :
            vk.press( keycode )
        self.timer.start( 350 )
    @QtCore.Slot( int )
    def release( self, keycode ) :
        if keycode :
            vk.release( keycode )
        if self.timer.isActive() :
            #print "click"
            pass
        else :
            #print "longpress"
            pass
    @QtCore.Slot()
    def toggle( self ) :
        self.toggled.emit()

if __name__ == "__main__" :
    import sys
    #import os
    #os.system( "xkbcomp remap.xkb :0" )
    app = QtGui.QApplication( sys.argv )

    kb = Keyboard( "qml/Keyboard.qml" )
    kb.show()

    sys.exit( app.exec_() )
