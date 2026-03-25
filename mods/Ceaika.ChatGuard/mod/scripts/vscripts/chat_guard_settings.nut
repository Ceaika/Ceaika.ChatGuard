global function ChatGuard_AddModSettings

void function ChatGuard_AddModSettings()
{
    ModSettings_AddModTitle( "ChatGuard" )
    ModSettings_AddModCategory( "Features" )
    ModSettings_AddSetting( "chatguard_kindness", "Kindness Mode", "bool" )
}