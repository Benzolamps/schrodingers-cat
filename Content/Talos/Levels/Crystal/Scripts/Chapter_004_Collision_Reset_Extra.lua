-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()

RunHandled(
  WaitForever,
  OnEvery(Event(detector.Activated)),
  function ()
    if not plasma:IsOpen() then
      player:ShowMessageOnHUD("TTRS:Hint.HoldToReset=Hold {plcmdHome} to reset")
    end
    detector:Recharge()
  end
)
