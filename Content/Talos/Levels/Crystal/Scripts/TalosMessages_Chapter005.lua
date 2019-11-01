-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)

-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()

character:Disappear(true)

if not talosProgress:IsVarSet("TalosMessage014") then
  character:LeaveTalosMessage(
    "TTRS:CrystalMessage:014=Another star, is protected by a code. I've searched all the corners here, but no clue was found.",
    player:GetPlayerName() .. " v4.7.5432",
    "custom",
    messageMarker
  )
  talosProgress:SetVar("TalosMessage014")
end