# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



u1 = User.create!(name: "Matt")
u2 = User.create!(name: "Bono")
u3 = User.create!(name: "Jasmine")

p1 = Poll.create!(title: "Do you like U2", author_id: u2.id)
p2 = Poll.create!(title: "Do you want to hear a dead baby joke?", author_id: u3.id)
p3 = Poll.create!(title: "Can I put some of my music on your Iphone?", author_id: u2.id)

q1 = Question.create!(body: "Who is in U2?", poll_id: p1.id)
q2 = Question.create!(body: "Who isn't U2?", poll_id: p1.id)
q3 = Question.create!(body: "What's funnier than a baby in a blender?", poll_id: p2.id)

a1 = AnswerChoice.create!(body: "steak sauce", question_id: q1.id)
a2 = AnswerChoice.create!(body: "Bono", question_id: q1.id)
a3 = AnswerChoice.create!(body: "The baby's face", question_id: q3.id)
a4 = AnswerChoice.create!(body: "A baby in a car crash", question_id: q3.id)
a5 = AnswerChoice.create!(body: "Bono", question_id: q3.id)

r1 = Response.create!(answer_id: a1.id, question_id: q1.id, user_id: u2.id)
r2 = Response.create!(answer_id: a4.id, question_id: q3.id, user_id: u1.id)
r3 = Response.create!(answer_id: a5.id, question_id: q3.id, user_id: u2.id)
