-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()
local mineDied = false

RunHandled(
  WaitForever,
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
  end,
  On(Event(mine.Died)),
  function ()
    mineDied = true
  end
)