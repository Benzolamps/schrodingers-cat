-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()

RunHandled(
  WaitForever,
  OnEvery(Any(Event(detector1.Activated), Event(detector2.Activated))),
  function ()
    if tetromino:IsPicked() and star:IsPicked() then return end
    if mthAbsF(mine:GetLinearVelocity().z) > 0.01 then
      local all = worldInfo:GetAllEntitiesOfClass("CJammerItemEntity")
      -- entity : CCarriableRodItemEntity
      for i, entity in ipairs(all) do
        if detector1:IsPointInArea(entity:GetPlacement():GetVect(), 0.5) then
          print(mine:GetPlacement():GetVect().z - entity:GetPlacement():GetVect().z)
          if mine:GetPlacement():GetVect().z - entity:GetPlacement():GetVect().z >= -5 then
            player:ShowMessageOnHUD("TTRS:Hint.HoldToReset=Hold {plcmdHome} to reset")
          end  
          detector1:Recharge()
          detector2:Recharge()          
          return      
        end
      end
      player:ShowMessageOnHUD("TTRS:Hint.HoldToReset=Hold {plcmdHome} to reset")          
    end  
    detector1:Recharge()
    detector2:Recharge()        
  end
)  
