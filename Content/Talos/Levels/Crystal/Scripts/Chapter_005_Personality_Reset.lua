-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()
RunHandled(
  WaitForever,
  OnEvery(Event(detector.Activated)),
  function()
    if worldInfo:IsTimeSwitchActive() or plasma1:IsOpen() or plasma2:IsOpen() then
      return
    end
    player:ShowMessageOnHUD("TTRS:Hint.HoldToReset=Hold {plcmdHome} to reset")
    detector:Recharge()
  end
)
