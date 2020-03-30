local playerIndicators = {source}

RegisterServerEvent('INDL')
RegisterServerEvent('INDR')

AddEventHandler('INDL', function(INDL)
	local netID = source
	TriggerClientEvent('updateIndicators', -1, netID, 'left', INDL)
	print(netID .. "Indicator left")
end)

AddEventHandler('INDR', function(INDR)
	local netID = source
	TriggerClientEvent('updateIndicators', -1, netID, 'right', INDR)
	print(netID .. "Indicator right")
end)
