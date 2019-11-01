-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()

RunHandled(
  WaitForever,
  OnEvery(Event(detector.Activated)),
  function ()
    local vElevator = elevator:GetPlacement():GetVect()
    if not (detector:IsPointInArea(vElevator, 0.5)) then
      Wait(Delay(1))
      player:ShowMessageOnHUD("TTRS:Hint.HoldToReset=Hold {plcmdHome} to reset")
    end
    detector:Recharge()
  end
)  
