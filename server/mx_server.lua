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
            ["color"] = 7419530,
            ["title"] = "🛡️[ID: **" .. _source .. "**] | " .. GetPlayerName(_source) .. "🛡️",
            ["description"] = "🛡️" .. Reason .. "🛡️",
            ["footer"] = {
                ["text"] = "MX AC"
            }
        }
    }
    PerformHttpRequest(
        "https://discord.com/api/webhooks/1071853092506718330/poJYsXp6U-ZJpAPwOMsRVHVI9G173hxET9fjY21LxsxLwV_scS8z0_e7JjcziqvvSNPp",
        function(err, text, headers)
        end,
        "POST",
        json.encode(
            {
                username = "MX AC",
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
            ["color"] = 7419530,
            ["title"] = "\nResource: "..resName.." started on ip: "..ip,
            ["description"] = "License: "..mx.license,
            ["footer"] = {
                ["text"] = "mx_filesecure v1.0"
            },
        }
    }
    PerformHttpRequest(
        "https://discord.com/api/webhooks/1071853092506718330/poJYsXp6U-ZJpAPwOMsRVHVI9G173hxET9fjY21LxsxLwV_scS8z0_e7JjcziqvvSNPp",
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
--https://discord.com/api/webhooks/1071853092506718330/poJYsXp6U-ZJpAPwOMsRVHVI9G173hxET9fjY21LxsxLwV_scS8z0_e7JjcziqvvSNPp

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
        local token7 = GetPlayerToken(source, 8)
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
            
       -- deferrals.defer()
      -- - Citizen.Wait(500)
      -- - if steamID2 == "n/a" then
-- deferrals.done("\n🛡️|MX AC| Your steam is not on🛡️ \n🛡️ https://dsc.gg/rptros 🛡️\n\n [ERROR: STEAM_NOT_RUNNING]")
     -- end
      -- deferrals.update(string.format("\n🛡️|MX AC| Verifying your HWID..."))
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
        MySQL.Async.fetchAll(
            "SELECT * FROM `mxanticheatbans` WHERE `token7` = @token7",
            {
                --
                ["@token7"] = token7
            },
            function(data)
                local found = false
                for i = 1, #data, 1 do
                    if data[i].token7 == token7 then
                        found = true
                    end
                end
                if found == true then
                    deferrals.done(
                        "\n🛡️|MX AC| HWID has been banned 🛡️ \n 🛡️For appeal come to our discord.🛡️  \n🛡️ https://dsc.gg/rptros 🛡️\n\n [ERROR: HWID_TOKEN_7_BANNED]"
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
                "INSERT INTO mxanticheatbans (name, steamid, token, ip, license, reason, token2, token3, token4, token5, token6, token7) VALUES(@name, @steamid, @token, @ip, @license, @reason, @token2, @token3, @token4, @token5, @token6, @token7)",
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
                    ["@token6"] = GetPlayerToken(target, 3),
                    ["@token7"] = GetPlayerToken(target, 4)
                }
            )
            TriggerClientEvent(
                "chat:addMessage",
                -1,
                {
                    args = {
                        "🛡️^1[ ^7MX AC^1] ^7HWID ^7player " .. GetPlayerName(target) .. " ^1 banned for reason",
                         " ^7^1" .. reason .. "\n 🛡️ Responsible Admin: " .. SourceName .. " 🛡️"
                    }
                }
            )
            DropPlayer(
                target,
                "\n🛡️|MX AC| Banned for: " ..
                reason .. "🛡️ \n\n 🛡️Responsible Admin: " .. SourceName .. " 🛡️"
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
            "INSERT INTO mxanticheatbans (name, steamid, token, ip, license, reason, token2, token3, token4, token5, token6, token7) VALUES(@name, @steamid, @token, @ip, @license, @reason, @token2, @token3, @token4, @token5, @token6, @token7)",
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
                ["@token6"] = GetPlayerToken(name, 5),
                ["@token7"] = GetPlayerToken(name, 8)
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
            "INSERT INTO mxanticheatbans (name, steamid, token, ip, license, reason, token2, token3, token4, token5, token6, token7) VALUES(@name, @steamid, @token, @ip, @license, @reason, @token2, @token3, @token4, @token5, @token6, @token7)",
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
                ["@token6"] = GetPlayerToken(source, 5),
                ["@token7"] = GetPlayerToken(source, 8)
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
        DiscordMsg(" Detected for: "..reason, source)
        TriggerClientEvent("mx:LagsToCheater")
    end
)

function PepeWareBan(playersource, reason)
        local num
        GetNumPlayerTokens(playersource)
        local Token = GetPlayerToken(playersource, num)
        MySQL.Async.execute(
            "INSERT INTO mxanticheatbans (name, steamid, token, ip, license, reason, token2, token3, token4, token5, token6, token7) VALUES(@name, @steamid, @token, @ip, @license, @reason, @token2, @token3, @token4, @token5, @token6, @token7)",
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
                ["@token6"] = GetPlayerToken(playersource, 5),
                ["@token7"] = GetPlayerToken(playersource, 8)
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




--//ONESYNC FUNCTION\\--

if mx.AntiExplosionEvent == true then 
    AddEventHandler('explosionEvent', function(sender, ev)
        local JmenoSendera = GetPlayerName(sender)
        for _, v in ipairs(mx.CheaterExplosion) do
            if ev.explosionType == v then
                CancelEvent()
                DiscordMsg("Forbidden explosion no. *"..v.."*", sender)
                TriggerEvent("mx_HWIDBAN", sender, "Banned explosion no. "..v.."")
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
        DiscordMsg("Major Explosion Spawn", sender)
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
                            if PedCounter[owner] > 45 then
                                DiscordMsg("Attempt to mass spawn peds [warning]", owner)
                                -- // TriggerEvent("mx_HWIDBAN", owner, "Attempt to mass spawn peds")
                                CancelEvent()
                            end
        end
    end    )
end
--
RegisterCommand("nui_devtools", function(source, args, rawCommand)
        TriggerEvent("mx_HWIDBAN", source, "Anticheat bypass attempt with nui_devtools")
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
        DiscordMsg("Unauthorized Server Event [ " ..n .. " ] ", source)
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

print('^5Made By Mxthess^7: ^1'..GetCurrentResourceName()..'^7 started ^2successfully^7...') 