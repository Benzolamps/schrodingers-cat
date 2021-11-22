if tetromino:IsPicked() then
  loweringFence:AssureOpened()
else
  Wait(Event(tetromino.Picked))
  loweringFence:Open()
end
