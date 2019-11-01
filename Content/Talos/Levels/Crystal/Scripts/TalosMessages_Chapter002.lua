-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)

-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()

character:Disappear(true)

if not talosProgress:IsVarSet("TalosMessage16") then
  character:LeaveTalosMessage(
    "TTRS:CrystalMessage:016=My cat is adorable.",
    player:GetPlayerName() .. " v12.7.1154",
    "custom",
    messageMarker
  )  
  talosProgress:SetVar("TalosMessage16")
end

