-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)

-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()

if talosProgress:IsVarSet("Status0") and not tetromino:IsPicked() then
  fanItem:SetPlacement(marker:GetPlacement())
else
  RunHandled(
    WaitForever,
    OnEvery(Event(detector.Activated)),
    function ()
      if (not talosProgress:IsVarSet("Status0")) then
        -- carriedItem : CGenericItemEntity
        local carriedItem = player:GetCarriedItem()
        if nil ~= carriedItem and carriedItem:GetClassName() == "CCarriableFanItemEntity" then
          Wait(Event(chapter.Started))
          Wait(Delay(2))
          talosProgress:SetVar("Status0")
          player:ShowMessageOnHUD("TTRS:CrystalHint.Saved=Saved!")
        end
      end
      detector:Recharge()
    end,
    On(Event(tetromino.Picked)),
    function ()
      talosProgress:ClearVar("Status0")
    end
  )
end
