-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()

if not tetormino:IsPicked() then
  RunHandled(
    WaitForever,
    On(Event(mine.Died)),
    function ()
      local vMine = mine:GetPlacement():GetVect()
        if not detector:IsPointInArea(vMine, 0.5) then
          while true do
            Wait(Delay(0.1))
              if worldInfo:GetCurrentChapter():GetName() == chapter:GetName() then
                player:ShowMessageOnHUD("TTRS:Hint.HoldToReset=Hold {plcmdHome} to reset")
              end
          end
        end
    end
  ) 
end