-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)
local catRunAway = false
RunHandled(
  function ()
    Wait(Event(chapter.Started))
    if not talosProgress:IsVarSet("Cat_Free") then
      cat:Appear()
      cat:NewClearState(0)
      cat:AddAnimation("Sitting", true, false, 1, 1)
      while true do
        local delay = mthRndRangeL(5, 10)
        Wait(Delay(delay))
        if catRunAway then break end
        Meowing:PlayOnce()
      end
    end
  end,
  On(Event(detector.Activated)),
  function ()
    worldInfo:ForceMusic("Event", musicCat)
    prjBackupAndSaveGameProgress(worldInfo)
    talosProgress:SetVar("Cat_Free")
    catRunAway = true
    catRun:PlayOnce()
    cat:NewClearState(0)
    cat:AddAnimation("Cat_Run_02", true, false, 1, 1)
    catMover:PlayAnimWait("Default")
    Wait(Delay(7))
    cat:Disappear()
    disappear:PlayOnce()
  end
)
