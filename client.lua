--[[
  --=--|----------------------------------------|--=--
		    UX INDICATORS
		a part of the UX family.

	===[Support] https://discord.gg/uVSbBrm
	===[Developer] Jack Crispy#3964

  --=--|----------------------------------------|--=--
]]--

  RegisterKeyMapping('turnleft', "Left turnsignal toggle", 'keyboard', "NUMPAD1")
  RegisterKeyMapping('turnright', "Right turnsignal toggle", 'keyboard', "NUMPAD3")
  RegisterKeyMapping('hazards', "Hazardlights toggle", 'keyboard', "NUMPAD0")

  RegisterCommand('turnleft', function()
	if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
	  TriggerEvent('IND', 'left')
	end
  end, false)

  RegisterCommand('turnright', function()
	if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
	  TriggerEvent('IND', 'right')
	end
  end, false)

  RegisterCommand('hazards', function()
	if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
	  TriggerEvent('IND', 'left')
	  TriggerEvent('IND', 'right')
	end
  end, false)

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
					TriggerServerEvent('INDL', INDL)
				elseif dir == 'right' then
					INDR = not INDR
					TriggerServerEvent('INDR', INDR)
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
