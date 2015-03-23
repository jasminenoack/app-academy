u1 = User.create!(email: "jasmine@example.com", username: "jasmine", password: "password1", confirm_password: "password1")
u2 = User.create!(email: "bono@example.com", username: "bono", password: "u2rocks1", confirm_password: "u2rocks1")
u3 = User.create!(email: "lydia@example.com", username: "lydia", password: "star_wars1", confirm_password: "star_wars1")


[
  "Garfunkel and Oates",
  "Tim Minchin",
  "Coolzey",
  "I Fight Dragons",
  "MC Frontalot",
  "MC Chris",
  "MC Lars",
  "YTCracker",
  "Satellite Lane",
  "Beefy",
  "Schaffer the Darklord",
  "Optimus Rhyme",
  "Adam WarRock",
  "The Grammar Club",
  "Kabuto the Python",
  "Jesse Dangerously",
  "Barenaked Ladies",
  "Dr. Awkward",
  "Mega Ran",
  "Spin Doctors",
  "Jonathan Coulton",
  "Kate Nash",
  "Bright Eyes",
  "Wheatus"
].each do |band|
  Band.create!(name: band, user_id: 1)
end

[
  "U2",
  "Fleetwood Mac",
  "Beatles"
].each do |band|
  Band.create!(name: band, user_id: 2)
end

[
  "U2",
  "System of a Down",
  "'Nsync",
  "Backstreet Boys"
].each do |band|
  Band.create!(name: band, user_id: 3)
end
