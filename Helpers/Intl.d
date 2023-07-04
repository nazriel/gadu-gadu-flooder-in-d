module Helpers.Intl;

private import std.conv, std.string, std.c.locale;

static this()
{
        setlocale (LC_ALL, "");
}

string _( string msgid )
{
	return to!string( gettext( toStringz( msgid ) ) );
}

string gettext( string msgid )
{
        return to!string( gettext( toStringz( msgid ) ) );
}

void bind_textdomain_codeset( string name, string codeset )
{
                bind_textdomain_codeset( toStringz( name ), toStringz( codeset ) );
}

void bindtextdomain( string name, string dir )
{
        bindtextdomain( toStringz( name ), toStringz( dir ) );
}

void textdomain( string name )
{
        textdomain( toStringz( name ) );
}

extern (C):
char *gettext ( const char* );
char* textdomain ( const char* );
char* bindtextdomain (const char *domainname, const char *dirname);
char* bind_textdomain_codeset( const char*, const char*);
