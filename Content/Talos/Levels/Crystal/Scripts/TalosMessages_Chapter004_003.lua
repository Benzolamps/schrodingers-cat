-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)

-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()

character:Disappear(true)

if not talosProgress:IsVarSet("TalosMessage012") then
  character:LeaveTalosMessage(
    "TTRS:CrystalMessage:012=Finally I find the solution, but, but I have to say that the terminal crashed by me, so I need to stay here. To my dismay, the rain never stops here.",
    player:GetPlayerName() .. " v45.32.7689",
    "custom",
    messageMarker
  )  
  talosProgress:SetVar("TalosMessage012")
end