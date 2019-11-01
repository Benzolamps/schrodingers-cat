-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)
-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()

local function BeforeCredits()
  terminal:AddString(player:GetPlayerName())
  local count = 0
  if talosProgress:IsVarSet("Epilogue_Picked1") then
    count = count + 1
  end
  if talosProgress:IsVarSet("Epilogue_Picked2") then
    count = count + 1
  end
  if talosProgress:IsVarSet("Epilogue_Picked3") then
    talosProgress:SetVar("Iodine")
  end
  if talosProgress:IsVarSet("Epilogue_Picked4") then
    talosProgress:SetVar("Probiotics")
  end
  if count == 0 then
    talosProgress:SetVar("Shrimps_0")
  end
  if count == 1 then
    talosProgress:SetVar("Shrimps_1")
  end
  if count == 2 then
    talosProgress:SetVar("Shrimps_2")
  end
  terminal:AddTerminalText("StoryEnd")
  Wait(Event(terminal.FinishedTyping))
end

Wait(Event(chapter.Started))
cameraEnd:DisableUserBreak()
cameraEnd:PlayAnimWait("FadingIn")
Wait(Event(cameraEnd.AnimationFinished))
RunAsync(
  function ()
    while true do
      cameraEnd:PlayAnimWait("Default")
      Wait(Event(cameraEnd.AnimationFinished))
    end
  end
)
Wait(Delay(0.5))
terminal:ClearTexts()
terminal:EnableOverlayRendering(true)
BeforeCredits()
terminal:AddTerminalText("Credits")
Wait(Event(terminal.FinishedTyping))
terminal:FadeOutText(0.5)
Wait(Delay(1))
terminal:EnableOverlayRendering(false)
endChapter:Start()