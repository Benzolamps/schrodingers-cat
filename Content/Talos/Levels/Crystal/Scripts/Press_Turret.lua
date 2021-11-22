RunHandled(
  WaitForever,
  OnEvery(Event(pressure.Pressed)),
  function ()
    turret:Disable()
  end,
  OnEvery(Event(pressure.Released)),
  function ()
    turret:Enable()
  end
)
