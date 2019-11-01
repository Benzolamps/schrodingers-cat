-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()

local function PuppetEntityCount()
local all = worldInfo:GetAllEntitiesOfClass("CPuppetEntity")
  local x = 0
  for i, puppet in ipairs(all) do x = x + 1 end
  return x
end

local sum = PuppetEntityCount()

local function ExistEntityInArea(entityStr, areaDetector)
  local all = worldInfo:GetAllEntitiesOfClass(entityStr)
  -- entity : CCarriableRodItemEntity
  for i, entity in ipairs(all) do
    local vEntity = entity:GetActualPlacement():GetVect()
    if areaDetector:IsPointInArea(vEntity, 0.5) then return 1 end
  end
  return 0
end

RunHandled(
  WaitForever,
  OnEvery(Event(detectorTrigger.Activated)),
  function ()
    detectorTrigger:Recharge()
    if tetromino:IsPicked() then return end
    if not worldInfo:IsTimeSwitchActive() then return end
    if sum < PuppetEntityCount() then return end
    if mthAbsF(Mine:GetLinearVelocity().z) >= 0.01 then return end
    if not ExistEntityInArea("CJammerItemEntity", detectorJammer) then return end
    if not ExistEntityInArea("CCarriableFanItemEntity", detectorFan) then return end
    player:ShowMessageOnHUD("TTRS:CrystalHint.Pressure=Don't forget to press the pressure plate")
  end
)