if string.match(arranger:GetName(), "Epilogue") then
  -- When in the epilogue, the arranger for selection needn't save the game
  arranger:DontSaveProgressWhenSolved()
end

RunHandled(
  function ()
    if arranger:IsSolved() then
      door:AssureOpened()
    end
    WaitForever()
  end,
  On(Event(arranger.Solved)),
  function ()
    door:Open()
  end
)
