-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)

-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()

character:Disappear(true)

if not talosProgress:IsVarSet("TalosMessage020") then
  character:LeaveTalosMessage(
    "TTRS:CrystalMessage.020=Wish it's the last one to solve, and I can find my cat.",
    player:GetPlayerName() .. " v7.49.5531",
    "custom",
    messageMarker
  )
  talosProgress:SetVar("TalosMessage020")
end
