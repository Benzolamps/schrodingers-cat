local bGlitchingEnabled = false
portalModel:Disappear()
zoneController:Enable(false)
local function StartGlitchGroup(group, penAnimator, penSound, material)
  RunAsync(
    function ()
      -- penSound : CStaticSoundEntity
      -- Set/Remove glitch material in loop because of translucent water in background. Otherwise looks awkward.
      while bGlitchingEnabled do
        local fRndPause1 = 0.2 + mthRndF() * 0.6
        Wait(Delay(fRndPause1))
        penAnimator:StartAnimation("On")
        -- Set glithc material on model array
        for i = 1, table.getn(group) do
          prjStartGlitching(group[i], material)
        end
        local fRndDuration = 0.1 + mthRndF() * 0.2
        penSound:PlayLooping()
        Wait(Delay(fRndDuration))
        penSound:Stop()
        penAnimator:StartAnimation("Off")
        -- Remove glitch material from group.
        for i2 = 1, table.getn(group) do
          prjStopGlitching(group[i2])
        end
      end
    end
  )
end

RunHandled(
  WaitForever,
  On(Event(door.Used)),
  function ()
    -- glitch storm
    bGlitchingEnabled = true
    -- Effects
    Wait(Delay(4.8))
    portal:SetPlacement(portalModel:GetPlacement())
    Wait(Delay(0.5))
    animator:StartAnimation("On")
    thunderSound:PlayOnce()
    windSound:PlayLooping()
    shakeEffect:StartShaking()
    -- Start glitch storm
    StartGlitchGroup(group1, penAnimator1, penSound1, material1)
    StartGlitchGroup(group2, penAnimator2, penSound2, material2)
    StartGlitchGroup(group3, penAnimator3, penSound3, material3)
    Wait(Delay(0.5))
    portalModel:Appear()
    Wait(Delay(4))
    plamsa:ForceOpen()
    while true do
      Wait(Delay(5))
      shakeEffect:StartShaking()
    end
  end
)

