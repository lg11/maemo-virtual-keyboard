#-!- coding=utf-8 -!-

from PySide import QtCore, QtGui, QtDeclarative

class Controlor( QtGui.QWidget ) :
    clicked = QtCore.Signal()
    longpressed = QtCore.Signal()
    def __init__( self, parent = None ) :
        QtGui.QWidget.__init__( self,  parent, QtCore.Qt.X11BypassWindowManagerHint | QtCore.Qt.WindowStaysOnTopHint )

        self.setAttribute( QtCore.Qt.WA_TranslucentBackground, True )

        palette = QtGui.QPalette()
        palette.setColor( QtGui.QPalette.Base, QtCore.Qt.transparent )

        self.view = QtDeclarative.QDeclarativeView( self )
        self.view.setAttribute( QtCore.Qt.WA_TranslucentBackground, True )
        self.view.setPalette( palette )
        self.view.setSource( "./qml/Controlor.qml" )

        context = self.view.rootContext()
        context.setContextProperty( "con", self )

        self.setFocusPolicy( QtCore.Qt.NoFocus )
        self.view.setFocusPolicy( QtCore.Qt.NoFocus )

        self.timer = QtCore.QTimer()
        self.timer.timeout.connect( self.timeout )
    @QtCore.Slot()
    def timeout( self ) :
        self.timer.stop()
    @QtCore.Slot()
    def press( self ) :
        self.timer.start( 350 )
    @QtCore.Slot()
    def release( self ) :
        if self.timer.isActive() :
            self.clicked.emit()
            #print "click"
        else :
            self.longpressed.emit()
            #print "longpress"

if __name__ == "__main__" :
    import sys
    app = QtGui.QApplication( sys.argv )

    #win = QtGui.QWidget()

    con = Controlor()

    con.move( 50, 50 )
    #vkb.view.move( 200, 200 )
    #vkb.resize( 10, 10 )
    con.show()

    sys.exit( app.exec_() )
