# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(name: 'pablito', email: 'pablito@mail.com')
user2 = User.create(name: 'jorgito', email: 'jorgito@mail.com')
event = Event.create(title: 'pedota', description: 'pedota por jose jose', start: Time.now, end: Time.now, location: 'casa de tu jefa', creator_id: 1)
attendance = Attendance.create(user_id: 1, event_id: 1)
attendance2 = Attendance.create(user_id: 2, event_id: 1)