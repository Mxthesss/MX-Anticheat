Config = {
    
    BlacklistWeaponLog = true, -- False to disable discord log of using BlackListed Weapons.
    KickPlayer = false,  -- True to kick player who give or have BlackListed Weapons.

    KickMessage = 'You have been kicked from the server for using black listed weapons!',

    DiscordWebhook = '-',
    WebhookName = 'MX_BlackListedWeapons',
    WebhookAvatarUrl = '-', 

    BlacklistedWeapons = {
        "WEAPON_BULLPUPSHOTGUN",
        "WEAPON_GRENADELAUNCHER",
        "WEAPON_GRENADELAUNCHER_SMOKE",
        "WEAPON_RPG",
        "WEAPON_STINGER",
        "WEAPON_MINIGUN",
    },
}

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
