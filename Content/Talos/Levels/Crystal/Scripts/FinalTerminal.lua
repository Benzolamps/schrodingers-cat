-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)
-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()
RunHandled(
  WaitForever,
  OnEvery(Event(terminal.Started)),
  function ()
    if not talosProgress:IsVarSet("Congratulated") then
      terminal:AddString(TranslateString("TTRS:CrystalTerminal.Congratulate=Congratulations, "))
      terminal:AddString(player:GetPlayerName())
      terminal:AddString(TranslateString("TTRS:CrystalTerminal.PassedTheTest=. You have passed the test. \n"))
      talosProgress:SetVar("Congratulated")
    end
  end,
  OnEvery(CustomEvent(terminal, "TerminalEvent_0")),
  function ()
    Wait(Event(terminal.Stopped))
    terminal:DisableUsage()
    Wait(Delay(0.5))
    chapter:Start()
  end
)
