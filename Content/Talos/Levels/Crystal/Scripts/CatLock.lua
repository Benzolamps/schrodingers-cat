-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)

if talosProgress:IsVarSet("Cat_Unlocked") then
  Barrier:Disappear()
  BarrierRemains:Appear()
else
  BarrierRemains:Disappear()
end
Wait(Event(Barrier.Destroyed))
talosProgress:SetVar("Cat_Unlocked")
