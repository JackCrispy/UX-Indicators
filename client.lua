--[[
  --=--|----------------------------------------|--=--
			    	UX INDICATORS
				a part of the UX family.

	===[Support] https://discord.gg/uVSbBrm
	===[Developer] Jack Crispy#3964

  --=--|----------------------------------------|--=--

--=-- ---------------------------------------- --=--
--=--            DON'T TOUCH BELOW             --=--
--=-- ---------------------------------------- --=--

]]--
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		if IsControlJustPressed(1, leftkey) then 
			if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
				TriggerEvent('IND', 'left')
			end
		end

		if IsControlJustPressed(1, rightkey) then 
			if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
				TriggerEvent('IND', 'right')
			end
		end
		
		if IsControlJustPressed(1, hazards) then
			if IsPedInAnyVehicle(GetPlayerPed(-1),true) then
				TriggerEvent('IND', 'left')
				TriggerEvent('IND', 'right')
			end
		end
		
    end
end)

local INDL = false -- Don't Touch
local INDR = false -- Don't Touch

AddEventHandler('IND', function(dir)
	Citizen.CreateThread(function()
		local Ped = GetPlayerPed(-1)
		if IsPedInAnyVehicle(Ped, true) then
			local Veh = GetVehiclePedIsIn(Ped, false)
			if GetPedInVehicleSeat(Veh, -1) == Ped then
				if dir == 'left' then
					INDL = not INDL
					TriggerServerEvent('IndicatorL', INDL)
				elseif dir == 'right' then
					INDR = not INDR
					TriggerServerEvent('IndicatorR', INDR)
				end
			end
		end
	end)
end)

RegisterNetEvent('updateIndicators')
AddEventHandler('updateIndicators', function(PID, dir, Toggle)
		local VehChecker = GetVehiclePedIsIn(GetPlayerPed(GetPlayerFromServerId(PID)), false)
		if dir == 'left' then
			SetVehicleIndicatorLights(VehChecker, 1, Toggle)
		elseif dir == 'right' then
			SetVehicleIndicatorLights(VehChecker, 0, Toggle)
	end
end)
