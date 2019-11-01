-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)
local sum = 0
local codeCache = -1
local playback = false

local function PuppetEntityCount()
  local all = worldInfo:GetAllEntitiesOfClass("CPuppetEntity")
  local x = 0
  for i, puppet in ipairs(all) do x = x + 1 end
  return x
end
Wait(Event(worldInfo.PlayerBorn))
sum = PuppetEntityCount()
RunHandled(
  WaitForever,
  OnEvery(Event(chapter.Started)),
  function ()
    sum = PuppetEntityCount()
  end,
  OnEvery(Event(terminal.Started)),
  function ()
    local code = mthRndRangeL(100, 999)
    if codeCache == -1 then
      talosProgress:SetCode("Code_Star", code)
    else
      if PuppetEntityCount() <= sum and worldInfo:IsTimeSwitchActive() then
        if playback then
          talosProgress:SetCode("Code_Star", codeCache)
          playback = false
        else
          talosProgress:SetCode("Code_Star", code)
        end
      else
        talosProgress:SetCode("Code_Star", codeCache)
      end
    end
  end,
  OnEvery(CustomEvent(terminal, "TerminalEvent_1")),
  function ()
    if PuppetEntityCount() <= sum and worldInfo:IsTimeSwitchActive() then
      if codeCache == -1 then
        codeCache = talosProgress:GetCodeValue("Code_Star")
        while PuppetEntityCount() <= sum and worldInfo:IsTimeSwitchActive() do
          Wait(Delay(0.1))
        end
        if worldInfo:IsTimeSwitchActive() then
          print("playback")
          playback = true
        else
          codeCache = -1
        end
      end
    else
      codeCache = -1
    end
  end,
  OnEvery(CustomEvent(terminal, "TerminalEvent_2")),
  function ()
    Wait(Delay(1))
    loweringFence:Open()
    Wait(Event(terminal.Stopped))
    terminal:DisableUsage()
  end
)