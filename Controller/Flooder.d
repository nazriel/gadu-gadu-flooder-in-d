module Controller.Flooder;

import gtk.ProgressBar, gtk.Builder, gtk.Window, gtk.Widget, gtk.Label, gtk.Button, gtk.Adjustment, gdk.Threads;
private import core.thread, std.socket, std.conv, std.string, std.random;
private import View.Flooder, Model.Main, Helpers.Gadu, Helpers.Intl, Helpers.Iconv;

class Flooder_Controller : Thread
{
        private:

        /*
        Class Variables
        */
        bool                     stopv = false;
        int                        destNumber;
        int                        msgCount;
        string                  msg;
        double                intervals;
        int iteration;
        /*
        Widgets
        */

        ProgressBar     progressBar;
        Adjustment       progressBarAdj;
        Window            mainWindow;
        Label                 numberLabel;
        Button               stopButton;

        public this (  int destNumber, int msgCount,  string msg, double intervals )
        {
                if ( msgCount > Main_Model.getGgNumbers().length )
                {
                                msgCount = cast( int ) Main_Model.getGgNumbers().length;
                }

                this.destNumber = destNumber;
                this.msgCount = msgCount;
                this.msg =  utf8_to_iso( msg );
                this.intervals = intervals;

                auto builder = new Builder;
                builder.addFromString( view, view.length );
                this.mainWindow = cast(Window) builder.getObject("progressWindow");
                this.mainWindow.setTitle( _( "Flooding" ) );

                /*
                Translate
                */
                ( cast( Label ) builder.getObject( "label2" ) ).setText( _("Please wait while ...") );

                this.numberLabel = cast( Label ) builder.getObject("numberLabel");
                this.numberLabel.setText( format(  _( "... sending messages to %d" ), destNumber ) );

                this.progressBar = cast( ProgressBar ) builder.getObject("progressbar");
                this.progressBarAdj = cast( Adjustment ) builder.getObject("progressAdj");
                this.progressBar.setText( format("0 / %s", msgCount ) );

                this.stopButton = cast(Button) builder.getObject("stopButton");
                this.stopButton.setLabel( _("Stop") );
                this.stopButton.addOnClicked( delegate void ( Button button ) { this.stop(); mainWindow.hideAll(); } );
                this.mainWindow.showAll();

                super.isDaemon( true );
                super( &run );
                super.start( );
        }

        void run()
        {
                int i = 1;
                this.iteration = 0;

                foreach ( number;  randomSample( Main_Model.getGgNumbers(), this.msgCount ) )
                {
                        if ( this.stopv == true )
                        {
                                break;
                        }

                        auto ggThread = new GG( number, this );
                        ggThread.start();

                        i++;
                         if ( i <= this.msgCount )
                         {
                                super.sleep( dur!("msecs")(  cast(long) ( this.intervals * 1000 ) ) );
                         }
                }
        }

        void stop()
        {
                this.stopv = true;
        }
}


class GG : Thread
{
        int number, destNumber;
        string msg;
        synchronized Flooder_Controller flooder;

        this ( int number, Flooder_Controller flooder)
        {
                this.number = number;
                this.flooder = flooder;

                super.isDaemon(true);
                super( &run );
        }

        void run ()
        {
                if ( this.flooder.stopv == true ) return;

                auto params = gg_login_params( this.number, toStringz( /* Tutaj idzie haslo do numerow gg :D */ ) );
                params.async = 0;
                params.status = GG_STATUS_INVISIBLE;

                auto sesja = gg_login( &params );
                if ( sesja )
                {
                        gg_notify( sesja, null, 0 );

                        if ( this.flooder.stopv == true )
                        {
                                gg_logoff( sesja );
                                gg_free_session( sesja );
                                return;
                        }

                        gg_send_message( sesja, GG_CLASS_CHAT, this.flooder.destNumber, toStringz( this.flooder.msg ) );
                        gg_ping( sesja );
                        gg_logoff( sesja );
                        gg_free_session( sesja );
                }

                this.flooder.iteration++;

                gdkThreadsEnter();

                double percent = ( to!double( this.flooder.iteration ) / to!double( this.flooder.msgCount ) ) * 100;
                this.flooder.progressBarAdj.setValue( percent );
                this.flooder.progressBar.setText( format( "%s / %s", ( this.flooder.iteration ), this.flooder.msgCount ) );
                gdkThreadsLeave();

                if ( this.flooder.iteration == this.flooder.msgCount )
                {
                        super.sleep ( dur!( "seconds" )( 3 ) );
                        this.flooder.mainWindow.hideAll();
                }
                super.yield( );
        }
}
