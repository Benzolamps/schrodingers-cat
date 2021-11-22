-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)

-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()

character:Disappear(true)

if not talosProgress:IsVarSet("TalosMessage019") then
  character:LeaveTalosMessage(
    "TTRS:CrystalMessage:019=I can't believe I'm going to die in three seconds.",
    player:GetPlayerName() .. " v7.5.6328",
    "custom",
    messageMarker
  )
  talosProgress:SetVar("TalosMessage019")
end
