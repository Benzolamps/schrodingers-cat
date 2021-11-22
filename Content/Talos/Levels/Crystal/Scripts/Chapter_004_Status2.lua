-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)

-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()

local function ExistClass(detector, str)
  local all = worldInfo:GetAllEntitiesOfClass(str)
  -- item : CCarriableRodItemEntity
  for i, item in ipairs(all) do
    local vItem = item:GetActualPlacement():GetVect()
    if detector:IsPointInArea(vItem, 0.5) then
      return 1
    end
  end
  return 0
end
if tetromino:IsPicked() and star:IsPicked() then
  talosProgress:ClearVar("Status2")
end
if tetromino:IsPicked() or talosProgress:IsVarSet("Status2") then
  loweringFence:AssureOpened()
else
  RunHandled(
    function ()
      Wait(Event(pressure.Pressed))
      while true do
        Wait(Delay(0.1))
        if not worldInfo:IsTimeSwitchActive() then
          break
        end
      end
      Wait(Delay(5))
      if not ExistClass(detector1, "CCarriableRodItemEntity") and not ExistClass(detector2, "CCarriableRodItemEntity") then
        while true do
          Wait(Delay(0.1))
          if fan:IsActive() then
            break
          end
        end
        talosProgress:SetVar("Status2")
        Wait(Delay(2))
        player:ShowMessageOnHUD("TTRS:CrystalHint.Saved=Saved!")
      end
      WaitForever()
    end,
    On(Event(tetromino.Picked)),
    function ()
      loweringFence:Open()
    end
  )
end
