-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)
local lolenabled = false

if talosProgress:IsVarSet("LOL_Needed") then
  lolenabled = true
end

if talosProgress:IsVarSet("Unlocked_Fan") then
  terminal:EnableASCIIAnimation(0)
  talosProgress:AssureUnlockedMechanic("MechanicFan")
  prjOnMechanicLockingChanged(worldInfo)
else
  if not arranger:IsSolved() then
    Wait(Event(arranger.Solved))
    Wait(Delay(1))
  end
  terminal:EnableASCIIAnimation(1)
end

RunHandled(
  WaitForever,
  On(CustomEvent(terminal, "TerminalEvent_1")),
  function ()
    Wait(Event(terminal.Stopped))
    terminal:EnableASCIIAnimation(0)
    talosProgress:AssureUnlockedMechanic("MechanicFan")
    prjOnMechanicLockingChanged(worldInfo)
  end,
  On(CustomEvent(terminal, "TerminalEvent_2")),
  function ()
    lolenabled = true
  end,
  OnEvery(CustomEvent(terminal, "TerminalEvent_3")),
  function ()
    Wait(Delay(0.5))
    terminal:ClearTexts()
    local path = Depfile("Content/Talos/Levels/Crystal/Texture/lol.tex")
    terminal:ShowImageDocument(path)
  end,
  OnEvery(CustomEvent("LOL")),
  function ()
    print("LOL")
    if lolenabled then
      Wait(Delay(0.5))
      sound:PlayOnce()
      talosProgress:SetVar("LOL_Finished")
    end
  end
)
