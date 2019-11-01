-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)

-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()

character:Disappear(true)

if not talosProgress:IsVarSet("TalosMessage013") then
  character:LeaveTalosMessage(
    "TTRS:CrystalMessage:013=The terminal crashed, and I cannot use this device, and even I cannot leave here. I'm stuck here forever.",
    player:GetPlayerName() .. " v68.7.2319",
    "custom",
    messageMarker
  )  
  talosProgress:SetVar("TalosMessage013")
end