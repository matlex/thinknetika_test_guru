# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(first_name: 'Matt', last_name: 'Ustinov', email: 'matt@mail.com')
user2 = User.create(first_name: 'Bob', last_name: 'Supp', email: 'bsupp@mail.com')

author1 = Author.create(first_name: 'Author', last_name: 'Authorious')

category1 = Category.create(title: 'Programming')
category2 = Category.create(title: 'Driving')
category3 = Category.create(title: 'Cooking')

test1 = Test.create(title: 'RoR beginner', level: 'beginner', category: category1, author: author1)
test2 = Test.create(title: 'RoR pro', level: 'pro', category: category1, author: author1)
test3 = Test.create(title: 'Ruby beginner', level: 'beginner', category: category1, author: author1)
test4 = Test.create(title: 'Ruby pro', level: 'pro', category: category1, author: author1)
test5 = Test.create(title: 'Car driving beginner', level: 'beginner', category: category2, author: author1)
test6 = Test.create(title: 'Car driving pro', level: 'pro', category: category2, author: author1)

PassedTest.create(user_id: user1.id, test_id: test1.id)
PassedTest.create(user_id: user1.id, test_id: test2.id)
PassedTest.create(user_id: user1.id, test_id: test3.id)
PassedTest.create(user_id: user1.id, test_id: test4.id)
PassedTest.create(user_id: user2.id, test_id: test5.id)
PassedTest.create(user_id: user2.id, test_id: test6.id)

q1 = Question.create(body: 'Question 1 about something?')
q2 = Question.create(body: 'Question 2 about something?')
q3 = Question.create(body: 'Question 3 about something?')
q4 = Question.create(body: 'Question 4 about something?')
q5 = Question.create(body: 'Question 5 about something?')
q6 = Question.create(body: 'Question 6 about something?')

test1.questions << q1
test2.questions << q2
test3.questions << q3
test4.questions << q4
test6.questions << q5
test6.questions << q6

q5.answers << Answer.create(body: 'Answer 1', correct: true)
q5.answers << Answer.create(body: 'Answer 2')
q5.answers << Answer.create(body: 'Answer 3')
q5.answers << Answer.create(body: 'Answer 4')
q5.answers << Answer.create(body: 'Answer 5')
q6.answers << Answer.create(body: 'Answer 6', correct: true)
q6.answers << Answer.create(body: 'Answer 7')
q6.answers << Answer.create(body: 'Answer 8')
q6.answers << Answer.create(body: 'Answer 9')
q6.answers << Answer.create(body: 'Answer10')
