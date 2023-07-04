module main;

import gtk.Main, gdk.Threads;
private import Helpers.Intl, Controller.Main;

void main( string[ ] args )
{
        version ( Windows )
        {
                bindtextdomain( "ggflooder", "./share/locale/" );
        }
        bind_textdomain_codeset( "ggflooder", "UTF-8" );
        textdomain( "ggflooder" );

        Main.initMultiThread( args );
        gdkThreadsInit( );
        gdkThreadsEnter( );

        new Main_Controller;

        Main.run( );
        gdkThreadsLeave( );
}
