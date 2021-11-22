-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)

-- for Entrance
talosProgress:StoreTetromino("DI99")
talosProgress:StoreTetromino("DO98")
talosProgress:StoreTetromino("DT97")
talosProgress:StoreTetromino("DT96")
talosProgress:StoreTetromino("DZ95")

-- for Fan
talosProgress:StoreTetromino("MS99")
talosProgress:StoreTetromino("MS98")
talosProgress:StoreTetromino("MS97")
talosProgress:StoreTetromino("ML96")
talosProgress:StoreTetromino("ML95")
talosProgress:StoreTetromino("ML94")

-- for Connector
talosProgress:StoreTetromino("MT93")
talosProgress:StoreTetromino("MT92")
talosProgress:StoreTetromino("MT91")

-- for Time Recorder
talosProgress:StoreTetromino("ML90")
talosProgress:StoreTetromino("MI89")
talosProgress:StoreTetromino("MS88")

talosProgress:FakeSeenArranger(puzzleDataDome)
talosProgress:FakeSeenArranger(puzzleDataFan)
talosProgress:FakeSeenArranger(puzzleDataRods)
talosProgress:FakeSeenArranger(puzzleDataTime)

local episode = "Content/Talos/Levels/Crystal.nfo"
for i = 22, 26, 1 do
  talUnlockPlayerMessage(worldInfo, episode, i)
end

if not talosProgress:IsCodeSet("End_Arranger") then
  talosProgress:SetCode("End_Arranger", 0)
end

-- notify that mechanic locking has changed so entities can be updated accordingly
prjOnMechanicLockingChanged(worldInfo)
