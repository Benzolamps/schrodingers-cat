-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)

-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()  

if tetromino:IsPicked() and star:IsPicked() then
  talosProgress:ClearVar("Status1")
end
if talosProgress:IsVarSet("Status1") and not (tetromino:IsPicked() and star:IsPicked()) then
  connector:SetPlacement(marker:GetPlacement())
else
  RunHandled(
    WaitForever,
    On(Event(detector.Activated)),
    function ()
      talosProgress:SetVar("Status1")    
      Wait(Delay(2))   
      player:ShowMessageOnHUD("TTRS:CrystalHint.Saved=Saved!")
    end
  )  
end