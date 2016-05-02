# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

User.create!(
    [
        {username: 'Fiorina', password_digest: '1234'},
        {username: 'Trump', password_digest: '1234'},
        {username: 'Carson', password_digest: '1234'},
        {username: 'Clinton', password_digest: '1234'}
    ]
)

Profile.delete_all

Profile.create!(
    [
        {first_name: 'Carly', last_name: 'Fiorina', gender: 'female', birth_year: 1954, user_id: User.find_by(username: 'Fiorina').id},
        {first_name: 'Donald', last_name: 'Trump', gender: 'male', birth_year: 1946, user_id: User.find_by(username: 'Trump').id},
        {first_name: 'Ben', last_name: 'Carson', gender: 'male', birth_year: 1951, user_id: User.find_by(username: 'Carson').id},
        {first_name: 'Hillary', last_name: 'Clinton', gender: 'female', birth_year: 1947, user_id: User.find_by(username: 'Clinton').id}
    ]
)

TodoList.delete_all

TodoList.create!(
    [
        {list_name: 'Carlys List', list_due_date: Date.today + 1.year, user_id: User.find_by(username: 'Fiorina').id},
        {list_name: 'Donalds List', list_due_date: Date.today + 1.year, user_id: User.find_by(username: 'Trump').id},
        {list_name: 'Bens List', list_due_date: Date.today + 1.year, user_id: User.find_by(username: 'Carson').id},
        {list_name: 'Hillarys List', list_due_date: Date.today + 1.year, user_id: User.find_by(username: 'Clinton').id}
    ]
)

TodoItem.delete_all

5.times do |index| 
     TodoItem.create!(title: 'Carly Title #{index}', description: 'Carly Description #{index}', due_date: Date.today + 1.year, todo_list_id: TodoList.find_by(user_id: User.find_by(username: 'Fiorina').id).id)
     end
5.times do |index| 
    TodoItem.create!(title: 'Trump Title #{index}', description: 'Trump Description #{index}', due_date: Date.today + 1.year, todo_list_id: TodoList.find_by(user_id: User.find_by(username: 'Trump').id).id)
    end
5.times do |index| 
    TodoItem.create!(title: 'Carson Title #{index}', description: 'Carson Description #{index}', due_date: Date.today + 1.year, todo_list_id: TodoList.find_by(user_id: User.find_by(username: 'Carson').id).id)
    end
5.times do |index| 
    TodoItem.create!(title: 'Hillary Title #{index}', description: 'Hillary Description #{index}', due_date: Date.today + 1.year, todo_list_id: TodoList.find_by(user_id: User.find_by(username: 'Clinton').id).id)
    end