RunHandled(
  WaitForever,
  OnEvery(Event(terminal.Started)),
  function()
    for i = 1, 5, 1 do
      Wait(CustomEvent(terminal, "TerminalEvent_" .. i))
      Wait(Delay(0.5))
      terminal:ClearTexts()
      local str = "Content/Talos/Levels/Crystal/Texture/tokitori"
      str = str .. i .. ".tex"
      terminal:ShowImageDocument(Depfile(str))
    end
  end
)
