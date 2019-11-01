-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)
RunHandled(
  function()
    while true do
      Wait(Delay(0.1))
      if worldInfo:GetCurrentChapter():GetName() == chapter2:GetName() then
        if talosProgress:GetCodeValue("End_Arranger") == 3 then
          chapterEndPuzzle:Start()
        end
      end
    end
  end,

  OnEvery(Any(Events(chapters.Started))),
  function ()
    if talosProgress:GetCodeValue("End_Arranger") == 3 then
      Wait(Delay(0.2))
      chapterEndPuzzle:Start()
    end
  end,
  	
  OnEvery(Event(detector.Activated)),
  function ()
    if talosProgress:GetCodeValue("End_Arranger") == 3 then
      chapterEndPuzzle:Start()
    else
      chapter2:Start()
    end
    detector:Recharge()
  end
)


