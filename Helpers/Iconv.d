module Helpers.Iconv;

private import std.string, std.stdio;
private import Helpers.Gadu;

string utf8_to_iso( string msg )
{
        size_t input_size = msg.length;

        if ( input_size > GG_MSG_MAXSIZE )
	{
	        msg = msg[ 0 ..  ( GG_MSG_MAXSIZE - 3 ) ] ~ "...";
	        input_size = GG_MSG_MAXSIZE;
	}

	char[]        input = cast(char[]) msg;
        char         *input_ptr = input.ptr;

	char         output[2000];
	size_t       output_size = output.length;
	char         *output_ptr =  output.ptr;

	auto iv = iconv_open( toStringz( "CP1250" ),  toStringz( "UTF-8" ) );
	iconv( iv, &input_ptr, &input_size, &output_ptr, &output_size ) ;
	iconv_close( iv );

	*output_ptr = '\0';

	return std.conv.to!string( output );
}


extern (C):

version ( Windows )
{
        alias void* iconv_t;
        size_t libiconv (iconv_t cd, const char* * inbuf, size_t * inbytesleft, const char* * outbuf, size_t * outbytesleft);
        iconv_t libiconv_open (const char* tocode, const char* fromcode);
        int libiconv_close (iconv_t);

        alias libiconv_open iconv_open ;
        alias libiconv iconv ;
        alias libiconv_close iconv_close;
}
else
{
        alias void* iconv_t;
        size_t iconv (iconv_t cd, const char* * inbuf, size_t * inbytesleft, const char* * outbuf, size_t * outbytesleft);
        iconv_t iconv_open (const char* tocode, const char* fromcode);
        int iconv_close (iconv_t);
}
