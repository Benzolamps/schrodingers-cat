-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)

-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()

character:Disappear(true)

if not talosProgress:IsVarSet("TalosMessage015") then
  character:LeaveTalosMessage(
    "TTRS:CrystalMessage.015=Eventually I found the cat but I didn't get it to survive.",
    player:GetPlayerName() .. " v24.5.8725",
    "custom",
    messageMarker
  )
  talosProgress:SetVar("TalosMessage015")
end
