local QBCore = exports['qb-core']:GetCoreObject()

local cooldown = {}
local info = {}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        for k, v in pairs(cooldown) do
            if v > 0 then
                cooldown[k] = v - 1
            end
        end
    end
end)

RegisterNetEvent('GENESEEItemDamage:Swimming', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local PlayerCooldown = QBCore.Functions.GetPlayer(src).PlayerData.name

    for a, b in pairs(Config.itemListSwimming) do
        local normalItem = b.normalItem
        local damageItem = b.damageItem
        local percentage = 0

        for c, d in pairs(QBCore.Functions.GetPlayer(src).PlayerData.items) do
            local PlayerItem = d.name
            local PlayerItemAmount = d.amount

            if PlayerItemAmount > 0 then
                if damageItem == nil then

                    if cooldown[PlayerCooldown] == 0 or not cooldown[PlayerCooldown] then
                        cooldown[PlayerCooldown] = 5

                        percentage = math.random(100)

                        if percentage >= 60 then
                            if Player.Functions.RemoveItem(normalItem, PlayerItemAmount, nil) then

                                if percentage >= 70 then
                                    TriggerClientEvent('QBCore:Notify', src,
                                        'Your backpack is open! You lost ' .. normalItem .. '.', 'success', 5000)
                                else
                                    TriggerClientEvent('QBCore:Notify', src,
                                        'Your backpack is torn! You lost ' .. normalItem .. '.', 'success', 5000)
                                end

                                percentage = 0
                                return true
                            end
                        end
                    else
                        return false
                    end
                else
                    if Player.Functions.RemoveItem(normalItem, PlayerItemAmount, nil) then
                        Player.Functions.AddItem(damageItem, 1, nil, info)
                        TriggerClientEvent('QBCore:Notify', src,
                            'Your ' .. normalItem .. ' burned when you entered the water.', 'success', 5000)
                        return true
                    end
                end
            end
        end
    end
end)

RegisterNetEvent('GENESEEItemDamage:Accident', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local PlayerCooldown = QBCore.Functions.GetPlayer(src).PlayerData.name

    for a, b in pairs(Config.itemListAccident) do
        local normalItem = b.normalItem
        local damageItem = b.damageItem
        local percentage = 0

        for c, d in pairs(QBCore.Functions.GetPlayer(src).PlayerData.items) do
            local PlayerItem = d.name
            local PlayerItemAmount = d.amount

            if PlayerItemAmount > 0 then
                if normalItem == PlayerItem then

                    if Player.Functions.RemoveItem(normalItem, PlayerItemAmount, nil) then
                        Player.Functions.AddItem(damageItem, 1, nil, info)
                        TriggerClientEvent('QBCore:Notify', src, 'Your ' .. normalItem .. ' broke after an accident.',
                            'success', 5000)
                        return true
                    end
                end
            end
        end
    end
end)
