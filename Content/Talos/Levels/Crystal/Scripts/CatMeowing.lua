local catRun = false
RunHandled(
  function ()
    Wait(Event(worldInfo.PlayerBorn))
    while true do
      local delay = mthRndRangeL(5, 10)
      Wait(Delay(delay))
      if catRun then break end
      Meowing:PlayOnce()
	end
  end,
  On(Event(door.Used)),
  function ()
    catRun = true
  end
)