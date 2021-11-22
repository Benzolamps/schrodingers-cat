-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)

-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()

if talosProgress:IsVarSet("Status3") and not (tetromino:IsPicked() and star:IsPicked()) then
  door:AssureOpened();
else
  RunHandled(
    WaitForever,
    On(Event(receiver.ChargedUp)),
    function ()
      door:Open()
      talosProgress:SetVar("Status3")
      Wait(Delay(2))
      player:ShowMessageOnHUD("TTRS:CrystalHint.Saved=Saved!")
    end
  )
end
