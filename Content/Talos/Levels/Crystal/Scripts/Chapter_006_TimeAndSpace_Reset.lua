-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()
RunHandled(
  WaitForever,
  OnEvery(Event(detector.Activated)),
  function ()
    detector:Recharge()
    if not turret:IsEnabled() then return end
    if worldInfo:IsTimeSwitchActive() then return end
    player:ShowMessageOnHUD("TTRS:Hint.HoldToReset=Hold {plcmdHome} to reset")
  end
)