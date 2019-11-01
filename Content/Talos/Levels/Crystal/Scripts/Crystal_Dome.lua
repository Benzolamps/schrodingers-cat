-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)
-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()

if string.match(worldInfo:GetWorldFileName(), "Hub.wld") then
  arranger:DontSaveProgressWhenSolved()
end

if arranger:IsSolved() then
  domeCollision:Disappear()
  dome:PlayAnimStay("Opened")
else
  Wait(Event(arranger.Solved))
  dome:PlayAnimStay("Opening")
  Wait(Delay(2))
  domeCollision:Disappear()
  if string.match(worldInfo:GetWorldFileName(), "Hub.wld") then
    local value = talosProgress:GetCodeValue("End_Arranger")
    talosProgress:SetCode("End_Arranger", value + 1)
    talBackupAndSaveTalosProgress(worldInfo)
  end
end