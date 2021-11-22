Wait(Event(star.Picked))
if turret:IsAlive() then
  Wait(Delay(4.0))
  worldGlobals.ElohimSayOnce(Depfile("Content/Talos/Locales/enu/Sounds/Voiceovers/Elohim/Elohim-019_I_see_all.ogg"), 1, false)
end
