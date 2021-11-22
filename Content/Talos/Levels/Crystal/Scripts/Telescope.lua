if CorIsAppVR() then
  telescope:Delete()
  Key:Disappear()
else
  local telescopeMask
  telescope:EnableUsage()

  RunHandled(
    WaitForever,
    OnEvery(Event(telescope.Used)),
    function (eeUsed)
      local player = eeUsed:GetUser()
      telescopeMask = player:FindHudElementByName("TelescopeMask")
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
end
