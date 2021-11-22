door:EnableUsage()
RunHandled(
  WaitForever,
  On(Event(door.Used)),
  function ()
    animator:PlayAnim("Open")
    sound:PlayOnce()
  end
)
