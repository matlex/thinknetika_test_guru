# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(first_name: 'Matt', last_name: 'Ustinov', email: 'matt@mail.com')
User.create(first_name: 'Bob', last_name: 'Supp', email: 'bsupp@mail.com')

Test.create(title: 'RoR', level: 'beginner')
Test.create(title: 'RoR', level: 'pro')
Test.create(title: 'Ruby', level: 'beginner')
Test.create(title: 'Ruby', level: 'pro')
Test.create(title: 'Car driving', level: 'beginner')
Test.create(title: 'Car driving', level: 'pro')

Category.create(title: 'Programming')
Category.create(title: 'Driving')
Category.create(title: 'Cooking')

Question.create(body: 'Question 1 about something?')
Question.create(body: 'Question 2 about something?')
Question.create(body: 'Question 3 about something?')
Question.create(body: 'Question 4 about something?')
Question.create(body: 'Question 5 about something?')
Question.create(body: 'Question 6 about something?')

Answer.create(body: 'Answer 1', correct: true)
Answer.create(body: 'Answer 2')
Answer.create(body: 'Answer 3')
Answer.create(body: 'Answer 4')
Answer.create(body: 'Answer 5')
Answer.create(body: 'Answer 6', correct: true)
Answer.create(body: 'Answer 7')
Answer.create(body: 'Answer 8')
Answer.create(body: 'Answer 9')
Answer.create(body: 'Answer10')
