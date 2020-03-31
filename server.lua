local playerIndicators = {source}

RegisterServerEvent('INDL')
RegisterServerEvent('INDR')

AddEventHandler('INDL', function(INDL)
	local netID = source
	TriggerClientEvent('updateIndicators', -1, netID, 'left', INDL)
end)

AddEventHandler('INDR', function(INDR)
	local netID = source
	TriggerClientEvent('updateIndicators', -1, netID, 'right', INDR)
end)
