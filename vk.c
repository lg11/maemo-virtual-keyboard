// Send a fake keystroke event to an X window.
// by Adam Pierce - http://www.doctort.org/adam/
// This is public domain software. It is free to use by anyone for any purpose.

// Python interface write by liang <sd.foolegg@gmail.com>
// This is public domain software. It is free to use by anyone for any purpose.

#include <X11/Xlib.h>
#include <X11/keysym.h>
#include <Python.h>

// A full list of available syms can be found in /usr/include/X11/keysymdef.h
static KeySym sym[60] ;
static Display* display ;
static Window root ;

XKeyEvent createKeyEvent( Display* display, Window win, Window root, int press, int keysym, int modifiers ) {
    XKeyEvent event ;

    event.display = display ;
    event.window = win ;
    event.root = root ;
    event.subwindow = None ;
    event.time = CurrentTime ;
    event.x = 1 ;
    event.y = 1 ;
    event.x_root = 1 ;
    event.y_root = 1 ;
    event.same_screen = True ;
    event.keycode = XKeysymToKeycode( display, keysym) ;
    event.state = modifiers ;

    if ( press ) {
        /*printf( "p\n" ) ;*/
        event.type = KeyPress ;
    }
    else {
        /*printf( "r\n" ) ;*/
        event.type = KeyRelease ;
    }

    return event ;
}

static PyObject* press( PyObject* self, PyObject* args ) {
    Window focus ;
    int revert ;
    int keysym ;

    if ( ! PyArg_Parse( args, "(i)", &keysym ) )
        return NULL ;

    XGetInputFocus(display, &focus, &revert);

    XKeyEvent event = createKeyEvent( display, focus, root, 1, sym[keysym], 0 ) ;
    XSendEvent( event.display, event.window, True, KeyPressMask, (XEvent *) &event) ;

    XFlush( display ) ;

    return Py_BuildValue( "i", keysym ) ;
}
    
static PyObject* release( PyObject* self, PyObject* args ) {
    Window focus ;
    int revert ;
    int keysym ;

    if ( ! PyArg_Parse( args, "(i)", &keysym ) )
        return NULL ;

    XGetInputFocus(display, &focus, &revert);
    
    XKeyEvent event = createKeyEvent( display, focus, root, 0, sym[keysym], 0 ) ;
    XSendEvent( event.display, event.window, True, KeyPressMask, (XEvent *) &event) ;

    XFlush( display ) ;

    return Py_BuildValue( "i", keysym ) ;
}

static struct PyMethodDef methods[] = {
    { "press", press, METH_VARARGS, "send key press event" } ,
    { "release", release, METH_VARARGS, "send key release event" } ,
    { NULL, NULL, 0, NULL }
} ;


/*XK_BackSpace            */
/*XK_Tab                  */
/*XK_Linefeed             */
/*XK_Clear                */
/*XK_Return               */
/*XK_Pause                */
/*XK_Scroll_Lock          */
/*XK_Sys_Req              */
/*XK_Escape               */
/*XK_Delete               */

/*XK_Shift_L              */
/*XK_Shift_R              */
/*XK_Control_L            */
/*XK_Control_R            */
/*XK_Caps_Lock            */
/*XK_Shift_Lock           */

/*XK_Meta_L               */
/*XK_Meta_R               */
/*XK_Alt_L                */
/*XK_Alt_R                */
/*XK_Super_L              */
/*XK_Super_R              */
/*XK_Hyper_L              */
/*XK_Hyper_R              */

void initvk() {
    sym[0] = 0 ;
    sym[1] = 0 ;
    sym[2] = 0 ;
    sym[3] = 0 ;
    sym[4] = 0 ;
    sym[5] = 0 ;
    sym[6] = 0 ;
    sym[7] = 0 ;
    sym[8] = 0 ;
    sym[9] = 0 ;
    sym[10] = XK_0 ;
    sym[11] = XK_1 ;
    sym[12] = XK_2 ;
    sym[13] = XK_3 ;
    sym[14] = XK_4 ;
    sym[15] = XK_5 ;
    sym[16] = XK_6 ;
    sym[17] = XK_7 ;
    sym[18] = XK_8 ;
    sym[19] = XK_9 ;
    sym[20] = 0 ;
    sym[21] = XK_a ;
    sym[22] = XK_b ;
    sym[23] = XK_c ;
    sym[24] = XK_d ;
    sym[25] = XK_e ;
    sym[26] = XK_f ;
    sym[27] = XK_g ;
    sym[28] = XK_h ;
    sym[29] = XK_i ;
    sym[30] = XK_j ;
    sym[31] = XK_k ;
    sym[32] = XK_l ;
    sym[33] = XK_m ;
    sym[34] = XK_n ;
    sym[35] = XK_o ;
    sym[36] = XK_p ;
    sym[37] = XK_q ;
    sym[38] = XK_r ;
    sym[39] = XK_s ;
    sym[40] = XK_t ;
    sym[41] = XK_u ;
    sym[42] = XK_v ;
    sym[43] = XK_w ;
    sym[44] = XK_x ;
    sym[45] = XK_y ;
    sym[46] = XK_z ;
    sym[47] = 0 ;
    sym[48] = 0 ;
    sym[49] = 0 ;
    sym[50] = 0 ;
    sym[51] = XK_space ;
    sym[52] = XK_Return ;
    sym[53] = XK_BackSpace ;
    sym[54] = XK_Shift_L ;
    sym[55] = XK_Control_L ;
    sym[56] = XK_Up ;
    sym[57] = XK_Down ;
    sym[58] = XK_Left ;
    sym[59] = XK_Right ;

    display = XOpenDisplay(0);
    root = XDefaultRootWindow(display);

    (void) Py_InitModule( "vk", methods ) ;
}
