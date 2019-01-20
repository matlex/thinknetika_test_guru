# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(first_name: 'Matt', last_name: 'Ustinov', email: 'matt@mail.com')
user2 = User.create(first_name: 'Bob', last_name: 'Supp', email: 'bsupp@mail.com')

category1 = Category.create(title: 'Programming')
category2 = Category.create(title: 'Driving')
category3 = Category.create(title: 'Cooking')

test1 = Test.create(title: 'RoR beginner', level: 'beginner', category: category1)
test2 = Test.create(title: 'RoR pro', level: 'pro', category: category1)
test3 = Test.create(title: 'Ruby beginner', level: 'beginner', category: category1)
test4 = Test.create(title: 'Ruby pro', level: 'pro', category: category1)
test5 = Test.create(title: 'Car driving beginner', level: 'beginner', category: category2)
test6 = Test.create(title: 'Car driving pro', level: 'pro', category: category2)

PassedTest.create(user_id: user1.id, test_id: test1.id)
PassedTest.create(user_id: user1.id, test_id: test2.id)
PassedTest.create(user_id: user1.id, test_id: test3.id)
PassedTest.create(user_id: user1.id, test_id: test4.id)
PassedTest.create(user_id: user2.id, test_id: test5.id)
PassedTest.create(user_id: user2.id, test_id: test6.id)

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
