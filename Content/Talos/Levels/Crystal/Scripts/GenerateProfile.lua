-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)
talosProgress:SetVar("Selected_Epitaph8")
tombstone:AssureTombstonesAreGenerated()
tombstone:AddPlayersEpitaph()
dofile("Content/Talos/Scripts/WorldCaching_Crystal.lua")