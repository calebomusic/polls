# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: "Matt", email: "matt.velker@gmail.com")
User.create(name: "Caleb", email: "calebomusic@gmail.com")

Poll.create(author_id: 1, title: "Pair Report")

Question.create(poll_id: 1, text: "How was Matt as a pair today?")

AnswerChoice.create(question_id: 1, text: "Amazing. Totally owned it. Green")
AnswerChoice.create(question_id: 1, text: "So-so. Struggled with some concepts. Didn't switch every 15 minutes. Yellow.")
AnswerChoice.create(question_id: 1, text: "Terrible partner. Terrible person. Red.")

Response.create(answer_choice_id: 3, respondent_id: 2)
