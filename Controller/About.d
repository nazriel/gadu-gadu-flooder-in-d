module Controller.About;

import gtk.Builder, gtk.Label, gdk.Pixbuf, gtk.Image, gtk.Window, gtk.Widget, gtk.Button, gdk.Event;
private import Helpers.Intl, View.About, Model.Main;

class About_Controller
{
        this()
        {
                auto builder= new Builder;
                builder.addFromString( view, view.length );
                builder.setTranslationDomain( "ggflooder" );

                /*
                Translate
                */
                ( cast( Label ) builder.getObject( "label1" ) ).setText( _("About") );
                ( cast( Label ) builder.getObject( "label2" ) ).setText( _("Authors") );
                ( cast( Label ) builder.getObject( "label3" ) ).setText( _("License") );
                ( cast( Label ) builder.getObject( "label4" ) ).setText( _("Small, multiplatform, l18n program allowing to send multiple messages from random numbers to one, specified reciver of Gadu-Gadu network IM client."
                                                                                                        "\n\nBig thanks to Bartlomiej Garnuch and Malwina Libiszewska for beta testing. ") );
                /*
                Program image
                */
                auto pngIcon = new Pixbuf( cast( string[] ) Main_Model.getIcon() );
                auto image = cast( Image ) builder.getObject( "image2" );
                pngIcon = pngIcon.scaleSimple( 40, 40, GdkInterpType.HYPER );
                image.setFromPixbuf( pngIcon );

                /*
                Program name + version
                */
                auto programName = cast( Label ) builder.getObject( "title" );
                programName.setText( "GG Flooder v1.0" );
                /*
                About Window
                */
                auto aboutWindow = cast( Window ) builder.getObject( "aboutWindow" );
                aboutWindow.addOnDelete( delegate bool (Event event, Widget widget) {  aboutWindow.hideAll(); return false; });
                aboutWindow.setTitle( _("About") );
                /*
                Quit Button
                */
                auto quitButton = cast( Button ) builder.getObject( "button1" );
                quitButton.setLabel( _( "Close" ) );
                quitButton.addOnClicked( delegate void ( Button button ) { aboutWindow.hideAll(); } );

                aboutWindow.showAll();
        }
}
