module Controller.Main;

import gtk.Main, gtk.Builder, gtk.Window, gtk.Widget, gtk.Label, gtk.Button, gtk.EntryBuffer, gtk.Adjustment, gtk.TextBuffer, gdk.Pixbuf, gdk.Event, gdk.Threads;
private import core.thread, std.conv, std.string, std.array;
private import Helpers.Intl, Helpers.Iconv, Helpers.Gadu, View.Main, Controller.About, Controller.Flooder, Model.Main;

class Main_Controller
{
        this()
        {
                auto builder = new Builder;
                builder.addFromString( view, view.length );
                builder.setTranslationDomain( "ggflooder" );

                /*
                MainWindow
                */
                auto mainWindow = cast( Window)  builder.getObject("mainWindow");
                mainWindow.addOnDelete( delegate bool (Event event, Widget widget) {  mainWindow.hideAll();  Main.exit(0); return false; });

                auto pngIcon = new Pixbuf( cast( string[] ) Main_Model.getIcon( ) );
                mainWindow.setDefaultIcon( pngIcon );

                /*
                Translations
                */
                // GG Number
                auto label4 = cast( Label ) builder.getObject( "label4" );
                label4.setText( _( "Nr GG" ) );
                label4.setTooltipText( _( "Gadu-Gadu number of message receiver" ) );

                // Floods count
                auto label5 = cast( Label ) builder.getObject( "label5" );
                label5.setText( _( "Floods count" ) );
                label5.setTooltipText( _( "Quantity of numbers used to send messages" ) );

                // Delays
                auto label2 = cast( Label ) builder.getObject( "label2" );
                label2.setText( _( "Delays (sec)" ) );
                label2.setTooltipText( _( "Amount of time between sending every message. Presented in seconds" ) );

                // Message
                auto label1 = cast( Label ) builder.getObject( "label1" );
                label1.setText( _( "Message" ) );
                label1.setTooltipText( format( _( "Text of the message. Maximum %d characters are allowed. Please do not past links into message, otherwise messages may be not delivered" ),  GG_MSG_MAXSIZE ) );

                /*
                About Button
                */
                auto aboutButton = cast(Button) builder.getObject("aboutButton");
                aboutButton.setLabel( _( "About" ) );
                aboutButton.addOnClicked( delegate void( Button button ){ new About_Controller; } );

                auto ggNumber = cast( EntryBuffer ) builder.getObject("ggNumberEntryBuffer");

                auto floodCount = cast( Adjustment ) builder.getObject("floods");
                floodCount.setUpper( Main_Model.getGgNumbers.length );
                auto floodMsg = cast( TextBuffer ) builder.getObject("msg");
                floodMsg.setText( _( "Hi there.\nCheck out driv.pl" ) );
                auto intervals = cast( Adjustment ) builder.getObject("intervals");

                auto okButton = cast( Button ) builder.getObject("okButton");
                okButton.setLabel( _( "Ok" ) );

                int ggDestNumber = 0;

                okButton.addOnClicked( delegate void ( Button button )
                                       {
                                            try
                                            {
                                                ggDestNumber = to!int( ggNumber.getText() );
                                            }
                                            catch ( Exception e )
                                            {
                                                ggDestNumber = 0;
                                            }

                                            new Flooder_Controller( ggDestNumber, to!int( floodCount.getValue() ), floodMsg.getText(),  intervals.getValue() );
                                        } );

                auto warningLabel = cast( Label ) builder.getObject( "vip" );
                /*
                Check out for use against authors!
                */
                ggNumber.addOnInsertedText( delegate void( uint cos, string text, uint cos2, EntryBuffer buffer ) {  checkOutVip( buffer.getText(), warningLabel, okButton ); } );
                ggNumber.addOnDeletedText( delegate void( uint cos, uint cos2, EntryBuffer buffer ) {  checkOutVip( buffer.getText(),  warningLabel, okButton ); } );

                /*
                Exit Button
                */
                auto exitButton = cast(Button) builder.getObject("exitButton");
                exitButton.setLabel( _( "Quit" ) );
                exitButton.addOnClicked( delegate void ( Button button ) { mainWindow.hideAll(); Main.exit(0); });

                mainWindow.show();
        }
}


void checkOutVip( string text, Label warning, Button okButton )
{
        static bool set = false;
        static bool warn = false;

        int typedNumber = -1;
        try
        {
                typedNumber = to!int( text );
        }
        catch ( Exception e )
        {
                typedNumber = -1;
        }

        if ( typedNumber == -1 )
        {
                if ( warn == false )
                {
                        warning.setText( _("Only numbers are supported.") );
                        warning.show( );
                        okButton.setSensitive(false);
                        warn = true;
                }
        }
        else
        {
                if ( warn == true )
                {
                        if ( set != true )
                        {
                                warning.hide( );
                                okButton.setSensitive(true);
                        }
                        warn = false;
                }
        }

        if ( !std.algorithm.find( Main_Model.getVipNumbers( ) , typedNumber ).empty )
        {
                if ( set == false )
                {
                        warning.setText( _("Flooding vip group member is not allowed!") );
                        warning.show( );
                        okButton.setSensitive(false);
                        set = true;
                }
        }
        else
        {
                if ( set == true )
                {
                        if ( warn != true )
                        {
                                warning.hide( );
                                okButton.setSensitive( true );
                        }
                        set = false;
                }
        }
}
