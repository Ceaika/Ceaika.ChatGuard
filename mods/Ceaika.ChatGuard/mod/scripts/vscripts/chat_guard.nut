global function addCallback
global function CollapseRepeats
global function ConvertLeetSpeak
global function ContainsSlur
global function callbacktest

//if someone tries to make a slur by spamming the letters multiple times
string function CollapseRepeats( string text )
{
    string result = ""
    int len = text.len()
    int i = 0
    while ( i < len )
    {
        string ch = text.slice( i, i + 1 )
        result += ch
        while ( i + 1 < len && text.slice( i + 1, i + 2 ) == ch )
        {
            i++
        }
        i++
    }
    return result
}

string function ConvertLeetSpeak( string text )
{
    text = StringReplace( text, "\\/\\/", "w", true, false )
    text = StringReplace( text, "|-|",    "h", true, false )
    text = StringReplace( text, "|_|",    "u", true, false )
    text = StringReplace( text, "|\\/|",  "m", true, false )
    text = StringReplace( text, "|\\|",   "n", true, false )
    text = StringReplace( text, "|<",     "k", true, false )
    text = StringReplace( text, "|>",     "p", true, false )
    text = StringReplace( text, "|3",     "b", true, false )
    text = StringReplace( text, "|2",     "r", true, false )
    text = StringReplace( text, "_|",     "j", true, false )
    text = StringReplace( text, "(|",     "q", true, false )
    text = StringReplace( text, "\\/",    "v", true, false )
    text = StringReplace( text, "><",     "x", true, false )
    text = StringReplace( text, "ph",     "f", true, false )
    text = StringReplace( text, "1",      "i", true, false )
    text = StringReplace( text, "!",      "i", true, false )
    text = StringReplace( text, "@",      "a", true, false )
    text = StringReplace( text, "4",      "a", true, false )
    text = StringReplace( text, "3",      "e", true, false )
    text = StringReplace( text, "0",      "o", true, false )
    text = StringReplace( text, "9",      "g", true, false )
    text = StringReplace( text, "5",      "s", true, false )
    text = StringReplace( text, "7",      "t", true, false )
    text = StringReplace( text, "$",      "s", true, false )
    text = StringReplace( text, "+",      "t", true, false )
    text = StringReplace( text, "|",      "i", true, false )
    text = StringReplace( text, "(",      "c", true, false )
    return text
}

bool function ContainsSlur( string text )
{
    string lower = text.tolower()

    lower = StringReplace( lower, "-",  "", true, false )
    lower = StringReplace( lower, "_",  "", true, false )
    lower = StringReplace( lower, ".",  "", true, false )
    lower = StringReplace( lower, " ",  "", true, false )
    lower = StringReplace( lower, "*",  "", true, false )
    lower = StringReplace( lower, "/",  "", true, false )
    lower = StringReplace( lower, "\\", "", true, false )
    lower = StringReplace( lower, "~",  "", true, false )
    lower = StringReplace( lower, ",",  "", true, false )

    lower = ConvertLeetSpeak( lower )
    lower = CollapseRepeats( lower )

    // ------Slurs ---------------------------------------------------------------------
    if ( lower.find( "nigger" ) != null ) return true
    if ( lower.find( "nigga" ) != null ) return true
    if ( lower.find( "nigg" ) != null ) return true
    if ( lower.find( "niga" ) != null ) return true
    if ( lower.find( "faggot" ) != null ) return true
    if ( lower.find( "fagot" ) != null ) return true
    if ( lower.find( "faget" ) != null ) return true
    if ( lower.find( "retard" ) != null ) return true
    if ( lower.find( "gay" ) != null ) return true
    if ( lower.find( "homosexual" ) != null ) return true
    if ( lower.find( "tard" ) != null ) return true
    if ( lower.find( "retar" ) != null ) return true
    if ( lower.find( "niger" ) != null ) return true
    if ( lower.find( "nig" ) != null ) return true
    if ( lower.find( "negr" ) != null ) return true
    if ( lower.find( "heil" ) != null ) return true

    // ------Phrases ---------------------------------------------------------------------
    string lowerOriginal = text.tolower()
    if ( lowerOriginal.find( "kill yourself" ) != null ) return true
    if ( lowerOriginal.find( "kill ur self" ) != null ) return true
    if ( lowerOriginal.find( "kill your self" ) != null ) return true
    if ( lowerOriginal.find( "kys" ) != null ) return true
    if ( lowerOriginal.find( "hang yourself" ) != null ) return true
    if ( lowerOriginal.find( "hang urself" ) != null ) return true
    if ( lowerOriginal.find( "rope yourself" ) != null ) return true
    if ( lowerOriginal.find( "rope urself" ) != null ) return true
    if ( lowerOriginal.find( "shoot yourself" ) != null ) return true
    if ( lowerOriginal.find( "shoot urself" ) != null ) return true
    if ( lowerOriginal.find( "slit your wrist" ) != null ) return true
    if ( lowerOriginal.find( "slit ur wrist" ) != null ) return true
    if ( lowerOriginal.find( "drink bleach" ) != null ) return true
    if ( lowerOriginal.find( "heil hitler" ) != null ) return true
    if ( lowerOriginal.find( "sieg heil" ) != null ) return true
    if ( lowerOriginal.find( "white power" ) != null ) return true
    if ( lowerOriginal.find( "white supremacy" ) != null ) return true
    if ( lowerOriginal.find( "master race" ) != null ) return true
    if ( lowerOriginal.find( "ethnic cleansing" ) != null ) return true
    if ( lowerOriginal.find( "get swatted" ) != null ) return true
    if ( lowerOriginal.find( "i know where you live" ) != null ) return true
    if ( lowerOriginal.find( "i know where u live" ) != null ) return true
    if ( lowerOriginal.find( "rape you" ) != null ) return true
    if ( lowerOriginal.find( "rape ur" ) != null ) return true
    if ( lowerOriginal.find( "gonna rape" ) != null ) return true

    return false
}

ClClient_MessageStruct function callbacktest( ClClient_MessageStruct message )
{
    if ( ContainsSlur( message.message ) )
    {
        message.shouldBlock = true
        Chat_GameWriteLine( "\x1b[31m[ChatGuard] " + message.playerName + " is using offensive language\x1b[0m" )
        Chat_NetworkWriteLine( "\x1b[31m[ChatGuard] " + message.playerName + " is using offensive language\x1b[0m" )
        return message
    }
    return message
}

void function addCallback()
{
    AddCallback_OnReceivedSayTextMessage( callbacktest )
}

//credits to Swifty8Bit for the original code structure and idea, 
//I compiled it for Squirrel and added a bit more functionality to it, 
//such as leet speak conversion and repeat collapsing. 
//I also added some more slurs and phrases to the list, but feel free to add more if you want.