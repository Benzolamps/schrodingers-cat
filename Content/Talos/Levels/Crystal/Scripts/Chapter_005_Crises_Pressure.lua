RunHandled(
  function()
    Wait(Event(mine.Died))
  end,
  OnEvery(Delay(0.01)),
  function ()
    local all = worldInfo:GetAllEntitiesOfClass("CCarriableItemEntity")
    -- item : CCarriableItemEntity
    for i, item in ipairs(all) do
      local vItem = item:GetActualPlacement():GetVect()
      if detector:IsPointInArea(vItem, 0.5) then
        local pItem = item:GetPlacement()
        local pPressure = pressure:GetPlacement()
        pItem.vx = pPressure.vx
        pItem.vz = pPressure.vz
        item:SetPlacement(pItem)
        print("cube's placement has been changed")
      end
    end
  end
)
