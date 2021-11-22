-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()

RunHandled(
  function()
    Wait(Event(mine.Died))
  end,
  OnEvery(Any(Event(detector1.Activated), Event(detector2.Activated))),
  function ()
    detector1:Recharge()
    detector2:Recharge()
    if not worldInfo:GetCurrentChapter():GetName() == chapter:GetName() then
      return
    end
    if mineDied then return end
    local vJammer = jammer:GetActualPlacement():GetVect()
    if not detector3:IsPointInArea(vJammer, 0.5) then
      player:ShowMessageOnHUD("TTRS:Hint.HoldToReset=Hold {plcmdHome} to reset")
    end
  end
)
