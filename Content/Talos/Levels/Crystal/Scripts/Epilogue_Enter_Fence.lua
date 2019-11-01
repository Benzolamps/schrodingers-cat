-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)
if talosProgress:IsVarSet("Entered_Epilogue") then
  loweringFence1:AssureOpened()
  loweringFence2:AssureOpened()
else
  while true do
    Wait(Delay(0.1))
    if red:IsChargedUp() and blue:IsChargedUp() then
      loweringFence1:Open()
      loweringFence2:Open()
      talosProgress:SetVar("Entered_Epilogue")
      talBackupAndSaveTalosProgress(worldInfo)
      break
    end
  end
end