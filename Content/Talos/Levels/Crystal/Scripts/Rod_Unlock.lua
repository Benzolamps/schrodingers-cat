-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)
if talosProgress:IsVarSet("Unlocked_Rod") then
  terminal:EnableASCIIAnimation(0)
  talosProgress:AssureUnlockedMechanic("MechanicRods")
  prjOnMechanicLockingChanged(worldInfo)
else
  if not arranger:IsSolved() then
    Wait(Event(arranger.Solved))
    Wait(Delay(3))
  end
  terminal:EnableASCIIAnimation(1)
end
Wait(CustomEvent(terminal, "TerminalEvent_1"))
Wait(Event(terminal.Stopped))
terminal:EnableASCIIAnimation(0)
Wait(Delay(1))
talosProgress:AssureUnlockedMechanic("MechanicRods")
prjOnMechanicLockingChanged(worldInfo)
