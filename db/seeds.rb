# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create a faculty member
User.create(email: "faculty@ncf.edu", password: "password", faculty: true, firstname: "John", lastname: "Doe")

# Create a student
User.create(email: "shane@ncf.edu", password: "password", faculty: false, firstname: "Shane", lastname: "A")

# Create some courses
Course.create(title: "Philosophy of science")
Course.create(title: "Philosophy of language")
Course.create(title: "Advanced Ethics")
Course.create(title: "Virtue and Vices")