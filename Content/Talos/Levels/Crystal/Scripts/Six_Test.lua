-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)
local sum = 0
local other = false

RunHandled(
  WaitForever,
  OnEvery(CustomEvent(terminal, "TerminalEvent_2")),
  function ()
    sum = sum + 6
    print(sum)
  end,
  OnEvery(CustomEvent(terminal, "TerminalEvent_3")),
  function ()
    sum = sum + 16
    print(sum)
  end,
  OnEvery(CustomEvent(terminal, "TerminalEvent_4")),
  function ()
    sum = sum + 60
    print(sum)
  end,
  OnEvery(CustomEvent(terminal, "TerminalEvent_5")),
  function ()
    print("other")
    other = true
  end,
  OnEvery(CustomEvent(terminal, "TerminalEvent_6")),
  function ()
    local rest = 100 - sum
    if other == false then
      if rest == 6 then
        talosProgress:SetVar("Need_6")
        print("rest6")
      elseif rest == 16 then
        talosProgress:SetVar("Need_16")
        print("rest16")
      elseif rest == 60 then
        talosProgress:SetVar("Need_60")
        print("rest60")
      else
        print("rest other")
      end
    end
    other = false
  end,
  OnEvery(CustomEvent(terminal, "TerminalEvent_7")),
  function ()
    sum = 0
    other = false
    talosProgress:ClearVar("Need_6")
    talosProgress:ClearVar("Need_16")
    talosProgress:ClearVar("Need_60")
  end
)
