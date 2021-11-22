-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()

if not tetormino:IsPicked() then
  RunHandled(
    WaitForever,
    OnEvery(Delay(0.1)),
    function()
      if pressure:IsPressed() and not worldInfo:IsTimeSwitchActive() then
        if worldInfo:GetCurrentChapter():GetName() == chapter:GetName() then
          player:ShowMessageOnHUD("TTRS:Hint.HoldToReset=Hold {plcmdHome} to reset")
        end
      end
    end
  )
end
