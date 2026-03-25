global function addCallback
global function ReplaceAll
global function CollapseRepeats
global function ConvertLeetSpeak
global function ContainsSlur
global function callbacktest

array<string> KIND_MESSAGES = [
    "I'm having a stressful day, please excuse my manners.",
    "Teamwork makes the dream work!",
    "Thanks for the fun match!",
    "You all play really well out there!",
    "Let's keep it friendly out here.",
    "I wonder sometimes if the enemy team is having fun too!",
    "I am trying to control my anger issues, please bear with me.",
    "Respect to all players in this match.",
    "May the best pilot win!",
    "No hard feelings, just having fun!",
    "I hope everyone is enjoying the game as much as I am!",
    "Let's keep the chat positive and supportive!",
    "Remember, we're all here to have fun and improve our skills!",
    "I hope Titanfall 3 is released some day",
    "My mouth was recently washed with soap!"
]

string function ReplaceAll( string text, string from, string to )
{
    while ( text.find( from ) != null )
    {
        text = StringReplace( text, from, to )
    }
    return text
}

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
    array<array<string> > subs = [
        ["\\/\\/", "w"], ["|-|", "h"], ["|_|", "u"], ["|\\/|", "m"],
        ["|\\|", "n"],   ["|<",  "k"], ["|>",  "p"], ["|3",   "b"],
        ["|2",   "r"],   ["_|",  "j"], ["(|",  "q"], ["\\/",  "v"],
        ["><",   "x"],   ["ph",  "f"], ["1",   "i"], ["!",    "i"],
        ["@",    "a"],   ["4",   "a"], ["3",   "e"], ["0",    "o"],
        ["9",    "g"],   ["5",   "s"], ["7",   "t"], ["$",    "s"],
        ["+",    "t"],   ["|",   "i"], ["(",   "c"]
    ]
    foreach ( sub in subs )
    {
        text = ReplaceAll( text, sub[0], sub[1] )
    }
    return text
}

bool function ContainsSlur( string text )
{
    string lower = text.tolower()

    array<string> separators = ["-", "_", ".", " ", "*", "/", "\\", "~", ","]
    foreach ( sep in separators )
    {
        lower = ReplaceAll( lower, sep, "" )
    }

    lower = ConvertLeetSpeak( lower )
    lower = CollapseRepeats( lower )

    array<string> slurs = [
        "nigger", "nigga", "nigg", "niga",
        "faggot", "fagot", "faget",
        "retard", "retar", "tard",
        "gay", "homosexual",
        "niger", "nig"
    ]
    foreach ( slur in slurs )
    {
        if ( lower.find( slur ) != null ) return true
    }

    array<string> phrases = [
        "kill yourself", "kill ur self", "kill your self", "kys",
        "hang yourself", "hang urself",
        "rope yourself", "rope urself",
        "shoot yourself", "shoot urself",
        "slit your wrist", "slit ur wrist",
        "drink bleach",
        "heil hitler", "sieg heil",
        "white power", "white supremacy", "master race", "ethnic cleansing",
        "get swatted",
        "i know where you live", "i know where u live",
        "rape you", "rape ur", "gonna rape"
    ]
    string lowerOriginal = text.tolower()
    foreach ( phrase in phrases )
    {
        if ( lowerOriginal.find( phrase ) != null ) return true
    }

    return false
}

ClClient_MessageStruct function callbacktest( ClClient_MessageStruct message )
{
    if ( !ContainsSlur( message.message ) )
        return message

    if ( GetConVarBool( "chatguard_kindness" ) )
    {
        int idx = RandomInt( KIND_MESSAGES.len() )
        message.message = "\x1b[110m" + KIND_MESSAGES[ idx ] + "\x1b[0m"
        return message
    }

    message.shouldBlock = true
    Chat_GameWriteLine( "\x1b[31m[ChatGuard] " + message.playerName + " is using offensive language\x1b[0m" )
    Chat_NetworkWriteLine( "\x1b[31m[ChatGuard] " + message.playerName + " is using offensive language\x1b[0m" )
    return message
}

void function addCallback()
{
    AddCallback_OnReceivedSayTextMessage( callbacktest )
}
