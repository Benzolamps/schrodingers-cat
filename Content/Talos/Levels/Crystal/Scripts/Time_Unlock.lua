-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)
-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()

character:Disappear(true)
if talosProgress:IsVarSet("Unlocked_Time") then 
  character:LeaveTalosMessage(
    "TTRS:CrystalMessage:010=Do not thank me, because I am another version of you.",
    player:GetPlayerName().." v45.32.7689",
    "custom",
    messageMarker
  )
else
  timeUseModel:EnableUsage()
  Wait(Event(timeUseModel.Used))
  sound:PlayOnce()
  Wait(Delay(0.5))
  character:SetCharacterName(player:GetPlayerName().." v45.32.7689")
  character:Appear(true)
  character:StartFadingIn(1)
  character:SetLookTarget(player)
  Wait(Delay(3))
  character:SetLookTarget(terminalModel)
  character:MoveToEntity(marker1)
  Wait(Event(character.GoalPointReached))
  Wait(Delay(0.5))
  terminal:ClearTexts()
  terminal:EnableOverlayRendering(true)
  terminal:AddTerminalText("Unlock_Time")
  Wait(Event(terminal.FinishedTyping))
  terminal:FadeOutText(0.5)
  Wait(Delay(1))
  terminal:EnableOverlayRendering(false)
  talosProgress:AssureUnlockedMechanic("MechanicTime")
  prjOnMechanicLockingChanged(worldInfo)
  character:MoveToEntity(marker2)
  character:SetLookTarget(messageMarker)
  Wait(Event(character.GoalPointReached))
  Wait(Delay(0.5))
  character:PlayAnim("QRPaint_Altar")
  Wait(Delay(1))
  character:LeaveTalosMessage(
    "TTRS:CrystalMessage:010=Do not thank me, because I am another version of you.",
    player:GetPlayerName().." v45.32.7689",
    "custom",
    messageMarker
  )
  Wait(Delay(2))
  character:SetLookTarget(player)
  Wait(Delay(3))
  character:StartFadingOut(1)
  Wait(Delay(1.5))
  character:Disappear(true)
end
