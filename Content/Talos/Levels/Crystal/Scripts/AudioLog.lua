-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)

local function HideAudioLog()
  chair:Disappear()
  detector:Deactivate()
  Wait(Delay(0.1))
  soundGlitch:StopLoopingFadeOut(1)
  particlesGlitch:Terminate()
  lightGlitch:Deactivate()
end

local function ShowAudioLog()
  detector:EnableTouchAutoMoveTarget(true)
  chair:Appear()
  soundGlitch:PlayLooping()
  particlesGlitch:Start()
  lightGlitch:Activate()
end

local str = soundGlitch:GetName()
if talosProgress:IsVarSet(str) then
  HideAudioLog()
else
  ShowAudioLog()
  Wait(Event(detector.Activated))
  HideAudioLog()
  talosProgress:SetVar(str)
  talBackupAndSaveTalosProgress(worldInfo)
end
