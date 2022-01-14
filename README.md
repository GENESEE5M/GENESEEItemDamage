# DAMAGE ITEM SYSTEM

This system will give more realism to your server

Need to edit the file

```
qb-smallresources/client/seatbelt.lua
```
changing to

```
function EjectFromVehicle()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    local coords = GetOffsetFromEntityInWorldCoords(veh, 1.0, 0.0, 1.0)
    SetEntityCoords(ped, coords)
    Wait(1)
    SetPedToRagdoll(ped, 5511, 5511, 0, 0, 0, 0)
    SetEntityVelocity(ped, veloc.x * 4, veloc.y * 4, veloc.z * 4)
    local ejectspeed = math.ceil(GetEntitySpeed(ped) * 8)
    if (GetEntityHealth(ped) - ejectspeed) > 0 then
        SetEntityHealth(ped, (GetEntityHealth(ped) - ejectspeed))
    elseif GetEntityHealth(ped) ~= 0 then
        SetEntityHealth(ped, 0)
    end
    TriggerServerEvent('GENESEEItemDamage:Accident')
end
```

## before entering the water
![This is an image](https://i.imgur.com/Qr8OGl8.png)

## now the item is defective, replaced to "PHONE DAMAGED"
![This is an image](https://i.imgur.com/teZoAqc.png)
![This is an image](https://i.imgur.com/rBEGHL4.png)

## Now the item will be lost
![This is an image](https://i.imgur.com/TVn1aOZ.png)
![This is an image](https://i.imgur.com/4QG6H3O.png)

## Now supported for car crash
After being thrown out of the car after an accident, you may end up breaking some items.
![This is an image](https://i.imgur.com/z9KdKRq.png)
![This is an image](https://i.imgur.com/VjzIglV.png)