-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()

RunHandled(
  WaitForever,
  OnEvery(Event(detector.Activated)),
  function ()
    player:ShowMessageOnHUD("TTRS:Hint.HoldToReset=Hold {plcmdHome} to reset")
    detector:Recharge()
  end
)
