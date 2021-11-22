local iNextThunder = 1

local function Lighting()
  ParticlesLightning:Start()
  if iNextThunder == 1 then
    LightningAnimator:StartAnimation("TurningOn")
    SoundThunder1:PlayOnce()
    iNextThunder = 2
    Wait(Delay(1))
  else
    SoundThunder2:PlayOnce()
    iNextThunder = 1
    Wait(Delay(2.1))
  end
  LightningAnimator:StartAnimation("TurningOff")
  ParticlesLightning:Stop()
  Wait(Delay(5 + mthRndF() * 20))
end

RainAnimator:StartAnimation("On")
worldInfo:SetMusic("Ambient", resRainyAmbient)
while true do Lighting() end
