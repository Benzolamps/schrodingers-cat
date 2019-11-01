-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()
while true do
  Wait(Delay(0.1))
  if worldInfo:GetCurrentChapter():GetName() == chapter:GetName() then
    player:ShowMessageOnHUD("")
  end
end
