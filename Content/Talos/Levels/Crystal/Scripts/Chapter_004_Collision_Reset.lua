-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()

local function ExistRodInArea()
  local all = worldInfo:GetAllEntitiesOfClass("CCarriableRodItemEntity")
  -- rod : CCarriableRodItemEntity
  for i, rod in ipairs(all) do
    local vRod = rod:GetActualPlacement():GetVect()
    if detector:IsPointInArea(vRod, 0.5) then
      return 1
    end
  end
  return 0
end

RunHandled(
  WaitForever,
  OnEvery(Event(detector.Activated)),
  function ()
    print(plasma:IsOpen() .. ExistRodInArea())
    if not (plasma:IsOpen() or ExistRodInArea()) then
      Wait(Delay(1))
      player:ShowMessageOnHUD("TTRS:Hint.HoldToReset=Hold {plcmdHome} to reset")
    end
    detector:Recharge()
  end
)  
   