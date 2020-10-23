let leap_year year =
  let divisibleBy x = year mod x = 0 in
  if divisibleBy 4 <> divisibleBy 100 then true
  else if divisibleBy 400 then true
  else false