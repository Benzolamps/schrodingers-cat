-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)
-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()
if not talosProgress:IsVarSet("AlternitiveUse_Hinted") then
  Wait(Event(detector.Activated))
  for i = 1, 15, 1 do
    Wait(Delay(2))
    player:ShowMessageOnHUD("TTRS:CrystalHint.AltUse={plcmdAltUse} Alternitive Use on Connector")
  end
  talosProgress:SetVar("AlternitiveUse_Hinted")
end