local telescopeMask = nil
telescope:EnableUsage()
RunHandled(
  WaitForever,
  OnEvery(Event(telescope.Used)),
  function (eeUsed)
    local player = eeUsed:GetUser()
    telescopeMask = player:GetHUD():FindHudElementByName("TelescopeMask")
    telescope:Disappear()
    player:EnterTelescopeState(telescope, 10.0, 60.0, 45.0)
    telescopeMask:SetVisible(true)
  end,
  OnEvery(CustomEvent("EndTelescopeState")),
  function ()
    telescopeMask:SetVisible(false)
    telescope:Appear()
    telescope:EnableUsage()
  end
)
