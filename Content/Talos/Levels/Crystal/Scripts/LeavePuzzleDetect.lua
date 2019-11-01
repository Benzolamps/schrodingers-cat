RunHandled(
  WaitForever,
  OnEvery(Event(detector.Activated)),
  function ()
    chapter:Start()
    detector:Recharge()
  end
)
