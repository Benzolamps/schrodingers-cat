-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)
-- player : CPlayerPuppetEntity
local player
RunAsync(
  function ()
    player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()
  end
)

character:Disappear(true)
Wait(Event(chapter.Started))
terminal:DisableUsage()
Wait(Delay(1))
character:StartFadingIn(1)
character:Appear(true)
character:SetCharacterName("Admin")
character:SetLookTarget(player)
Wait(Delay(5))
character:MoveToEntity(marker1)
Wait(Event(character.GoalPointReached))
character:SetLookTarget(door)
Wait(Delay(1))
door:Unlock()
door:Open()
Wait(Delay(2))
character:MoveToEntity(marker2)
character:SetLookTarget(player)
Wait(Event(character.GoalPointReached))
Wait(Delay(3))
character:StartFadingOut(1)
Wait(Delay(1.5))
character:Disappear(true)
Wait(Delay(1))
player:Disappear(1)

Wait(Delay(0.5))
playerCut:Appear()
playerCut:NewClearState(0)
if (talosProgress:IsVarSet("Cat_Free")) then
  playerCut:AddAnimation("Walk_With_Cat_02", true, false, .35, 1)
  playerCut:ShowAttachment("Cat")
else
  playerCut:AddAnimation("Walk_SS3", true, false, .35, 1)
end
playerCutMover:PlayAnim("Default")

camera:DisableUserBreak()
camera:PlayAnimWait("FadingIn")
Wait(Event(camera.AnimationFinished))   
camera:PlayAnimWait("Default")    
Wait(Event(camera.AnimationFinished))
camera:PlayAnimWait("FadingOut")
Wait(Event(camera.AnimationFinished))
Wait(Delay(0.5))
creditsChapter:Start()