# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = ["Vegetable","Electronics","Books","Grocery","Sports"]
roles = ["admin","user"]
roles.each{|role| Role.create(name: role)}
admin_user = User.create(username: 'Admin',
                    email: 'admin@gmail.com',
                    password: 'password1234',
                    password_confirmation: 'password1234')
admin_user.add_role(:admin)
categories.each{ |cat| Category.create(name: cat) }

