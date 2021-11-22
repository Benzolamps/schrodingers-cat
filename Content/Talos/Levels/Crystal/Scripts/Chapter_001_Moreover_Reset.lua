-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()

if not tetormino:IsPicked() then
  RunHandled(
    WaitForever,
    OnEvery(Delay(0.1)),
    function ()
      local vPlayer = player:GetPlacement():GetVect()
      local vCube = cube:GetActualPlacement():GetVect()
      if (not (detector:IsPointInArea(vPlayer, 0.5))) and detector:IsPointInArea(vCube, 0.5) then
        if worldInfo:GetCurrentChapter():GetName() == chapter:GetName() then
          player:ShowMessageOnHUD("TTRS:Hint.HoldToReset=Hold {plcmdHome} to reset")
        end
      end
    end
  )
end
