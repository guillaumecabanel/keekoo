Moment.destroy_all
User.destroy_all

user = User.create!(email: 'user@example.com', nickname: 'Alice', password: 'password')

user.tribes.create!(title: 'Friends')
user.tribes.create!(title: 'Family')
