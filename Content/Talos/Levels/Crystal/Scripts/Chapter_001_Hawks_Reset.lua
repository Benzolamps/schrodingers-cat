-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()
local num = 0

if not tetormino:IsPicked() then
  RunHandled(
    WaitForever,
    OnEvery(Delay(0.1)),
    function ()
      if num == 1 then
        Wait(Delay(2))
        if num ~= 1 then return end
        if worldInfo:GetCurrentChapter():GetName() == chapter:GetName() then
          player:ShowMessageOnHUD("TTRS:Hint.HoldToReset=Hold {plcmdHome} to reset")
        end
      end
    end,
    OnEvery(Any(Event(mine1.Died), Event(mine2.Died))),
    function ()
      num = num + 1
    end
  )
end