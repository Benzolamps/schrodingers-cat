-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)
-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()

while true do
  if talosProgress:IsVarSet("FastForward_Hinted") then break end
  Wait(Delay(0.1))
  if worldInfo:IsTimeSwitchActive() then
    for i = 0, 15, 1 do
      Wait(Delay(2))
      player:ShowMessageOnHUD("TTRS:CrystalHint.FastFwd=Fast forward by holding {plcmdFastForward} ")
    end
    talosProgress:SetVar("FastForward_Hinted")
    break
  end
end