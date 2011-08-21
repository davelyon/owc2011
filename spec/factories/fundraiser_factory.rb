Factory.define :fundraiser do |t|
  t.start_at {Date.today}
  t.end_at {Date.today + 2.hours}
end
