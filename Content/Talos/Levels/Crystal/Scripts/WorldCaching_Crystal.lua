local levels = {
  "Content/Talos/Levels/Crystal/Chapter_001.wld",
  "Content/Talos/Levels/Crystal/Chapter_002.wld",
  "Content/Talos/Levels/Crystal/Chapter_003.wld",
  "Content/Talos/Levels/Crystal/Chapter_004.wld",
  "Content/Talos/Levels/Crystal/Chapter_005.wld",
  "Content/Talos/Levels/Crystal/Chapter_006.wld",
  "Content/Talos/Levels/Crystal/Room.wld",
}

local worldCache
local AddToWorldCache
local AddToWorldCache_AsHighPriority
local RemoveFromWorldCache
if globals ~= nil then
  worldCache = globals.worldCache
  AddToWorldCache = function (level)
    worldCache:AddToCache(level)
  end
  AddToWorldCache_AsHighPriority = function (level)
    worldCache:AddToCache_AsHighPriority(level)
  end
  RemoveFromWorldCache = function (level)
    worldCache:RemoveFromCache(level)
  end
else
  worldCache = worldGlobals.worldInfo
  AddToWorldCache = function (level)
    worldCache:AddToWorldCache(level)
  end
  AddToWorldCache_AsHighPriority = function (level)
    worldCache:AddToWorldCache_AsHighPriority(level)
  end
  RemoveFromWorldCache = function (level)
    worldCache:RemoveFromWorldCache(level)
  end
end

local function Select(flags)
  for i, level in ipairs(levels) do
    if flags[i] == 1 then
      AddToWorldCache(level)
      print(level .. "+")
    else
      RemoveFromWorldCache(level)
      print(level .. "-")
    end
  end
end

local worldFileName = worldCache:GetWorldFileName()

AddToWorldCache_AsHighPriority("Content/Talos/Levels/Crystal/Hub.wld")
if string.match(worldFileName, "Room.wld") then
  Select({1, 0, 0, 0, 0, 0, 1})
elseif string.match(worldFileName, "Hub.wld") then
  Select({1, 1, 1, 1, 1, 1, 1})
else
  Select({0, 0, 0, 0, 0, 0, 0})
  AddToWorldCache(worldFileName)
end
