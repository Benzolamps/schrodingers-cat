-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)
-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()

if talosProgress:IsVarSet("Unlocked_Cube") then
  terminal:EnableASCIIAnimation(0)
else
  terminal:EnableASCIIAnimation(1)
  Wait(Event(terminal.Started))
  if not talosProgress:IsVarSet("Seen_You") then
    terminal:AddString(TranslateString("TTRS:CrystalTerminal.Hello=Hello, "))
    terminal:AddString(player:GetPlayerName())
    terminal:AddString(TranslateString("TTRS:CrystalTerminal.Welcome=! \n%w14Welcome to the world of Elohim! \n%w14"))
    terminal:AddString(TranslateString("TTRS:CrystalTerminal.KnowYourName=Please don't ask who I am and why I know your name. %w14"))
    terminal:AddString(TranslateString("TTRS:CrystalTerminal.NotImportant=That's not important. \n%w14"))
    terminal:AddString(TranslateString("TTRS:CrystalTerminal.Hardships=You need to overcome the hardships %w14"))
    terminal:AddString(TranslateString("TTRS:CrystalTerminal.FindMe=and find me as well your cat. \n%w14"))
    talosProgress:SetVar("Seen_You")
  end
  Wait(CustomEvent(terminal, "TerminalEvent_1"))
  Wait(Event(terminal.Stopped))
  terminal:EnableASCIIAnimation(0)
  Wait(Delay(1))
  talosProgress:AssureUnlockedMechanic("MechanicCube")
  prjOnMechanicLockingChanged(worldInfo)
end