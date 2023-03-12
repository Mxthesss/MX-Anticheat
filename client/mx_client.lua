RegisterNetEvent("mx:LagsToCheater")
AddEventHandler("mx:LagsToCheater", function()

	while true do end

end)


if mx.weaponblacklisting == true then
Citizen.CreateThread(function()
	while true do
		Wait(1)
		playerPed = GetPlayerPed(-1)
		if playerPed then
			nothing, weapon = GetCurrentPedWeapon(playerPed, true)
			if isWeaponBlacklisted(weapon) then 
		  RemoveWeaponFromPed(playerPed, weapon)
		  TriggerServerEvent("mx_HWIDBAN", sender, "Black Listed Weapon")
			end
		end
	end
end)
end

function isWeaponBlacklisted(model)
	for _, blacklistedWeapon in pairs(unkw.zbrane) do
		if model == GetHashKey(blacklistedWeapon) then
			return true
		end
	end
	return false
end

print('^5Made By Mxthess^7: ^1'..GetCurrentResourceName()..'^7 started ^2successfully^7...') 