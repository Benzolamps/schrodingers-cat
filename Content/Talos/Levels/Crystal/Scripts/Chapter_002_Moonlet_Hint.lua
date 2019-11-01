-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()

-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)

if talosProgress:IsVarSet("Moonlet_Failed_Twice") or tetromino:IsPicked() then
  barrier:Disappear()
else
  while true do
    Wait(Delay(0.1))
    if player:GetPlacement().vy >= 4 and worldInfo:GetDistance(player, mine) <= 2 then
      Wait(Delay(2))
      local vMine = mine:GetPlacement():GetVect()
      if detector:IsPointInArea(vMine, 0.5) then
        player:ShowMessageOnHUD("TTRS:CrystalHint.MoonletPerfect=Perfect landing!")
      else
        if talosProgress:IsVarSet("Moonlet_Failed_Once") then
          player:ShowMessageOnHUD("TTRS:CrystalHint.MoonletFailedAgain=Are you serious? You'd better ask the Moon for help!")
          talosProgress:SetVar("Moonlet_Failed_Twice")
          barrier:Disappear()
        else
          player:ShowMessageOnHUD("TTRS:CrystalHint.MoonletFailed=Failed? Try again, please!")
          talosProgress:SetVar("Moonlet_Failed_Once")
        end
      end
    end
  end
end

