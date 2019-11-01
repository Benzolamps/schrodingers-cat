-- player : CPlayerPuppetEntity
local player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()
-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)
local episode = "Content/Talos/Levels/Crystal.nfo"

local function ElohimSpeakGuardians()
  if talosProgress:IsVarSet("PlayerKilledByGuardians") then
    talosProgress:ClearVar("PlayerKilledByGuardians")
    talosProgress:SetVar("KilledHinted")
    Wait(Delay(1))
    local path = Depfile("Content/Talos/Locales/enu/Sounds/Voiceovers/Elohim/Elohim-037_The_guardians_of_this_land.ogg")
    elohim:StartSimpleWithDelayedObtain(path)
  end
end

local function GetTetrominoesCount()
  local prepared = 17
  local tetrominoes = talosProgress:GetInventoryTetrominoes() .. talosProgress:GetUsedupTetrominoes()
  local _, doors = string.gsub(tetrominoes, "D", "")
  local _, mechs = string.gsub(tetrominoes, "M", "")
  local _, nexus = string.gsub(tetrominoes, "N", "")
  return doors + mechs + nexus - 17
end

dofile("Content/Talos/Scripts/WorldCaching_Crystal.lua")
RunHandled(
  function ()
    ElohimSpeakGuardians()
    print(talGetUnlockedPlayerMessagesCount(worldInfo))
    WaitForever()
  end,
  OnEvery(CustomEvent("TetrominoAwarded")),
  function ()
    local count = GetTetrominoesCount()
    print(count .. " sigils")
    for i = 1, 7, 1 do
      if i * 3 - 1 == count then
        talUnlockPlayerMessage(worldInfo, episode, 26 + i)
        print("#" .. (26 + i) .. "Unlocked")
      end
    end
  end,
  OnEvery(Event(player.Died)),
  function (e)
    local killer = e:GetKiller():GetClassName()
    if (killer == "CMinePuppetEntity" or killer == "CAutoTurretEntity") and not talosProgress:IsVarSet("KilledHinted") then
      talosProgress:SetVar("PlayerKilledByGuardians")
    end
  end
)
