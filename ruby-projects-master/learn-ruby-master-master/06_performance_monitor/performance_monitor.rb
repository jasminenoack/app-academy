def measure (num=1)
  t=Time.now
  num.times{yield}
  (Time.now-t)/num
end