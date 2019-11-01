-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)

-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()          

if tetromino:IsPicked() and star:IsPicked() then
  talosProgress:ClearVar("Status4")
end
if talosProgress:IsVarSet("Status4") and not (tetromino:IsPicked() and star:IsPicked()) then
  mine:SetPlacement(mineMarker:GetPlacement())
  jammer:SetPlacement(jammerMarker:GetPlacement())
else
  RunHandled(
    WaitForever,
    On(Event(mine.Died)),
    function ()
      talosProgress:SetVar("Status4")
      Wait(Delay(2))   
      player:ShowMessageOnHUD("TTRS:CrystalHint.Saved=Saved!")      
    end
  )  
end