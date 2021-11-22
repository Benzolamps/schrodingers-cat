-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)

-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()

character:Disappear(true)

if not talosProgress:IsVarSet("TalosMessage18") then
  character:LeaveTalosMessage(
    "TTRS:CrystalMessage.018=But I finished it prefectly.",
    player:GetPlayerName() .. " v25.6.9867",
    "custom",
    messageMarker
  )
  talosProgress:SetVar("TalosMessage18")
end
