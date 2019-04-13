# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ----- Create some accounts -----

# Create a faculty member
User.create(email: "faculty@ncf.edu", password: "password", faculty: true, firstname: "John", lastname: "Doucette")

# Create a student
User.create(email: "student@ncf.edu", password: "password", faculty: false, firstname: "Jane", lastname: "Smith")

# ----- Create some majors, courses, and corresponding requirement areas -----

# Computer Science
cs = Major.create(title: "Computer Science")

calculus_1 = Course.create(title: "Calculus 1")
calculus_2 = Course.create(title: "Calculus 2")
discrete_mathematics = Course.create(title: "Discrete Mathematics")

sql = Course.create(title: "Intro to SQL")
database_design = Course.create(title: "Database Design")

cs_maths_req = Requirement.new(name: "Mathematics", major: cs)
cs_maths_req.courses << calculus_1
cs_maths_req.courses << calculus_2
cs_maths_req.courses << discrete_mathematics
cs_maths_req.save

cs_databases_req = Requirement.new(name: "Databases", major: cs)
cs_databases_req.courses << sql
cs_databases_req.courses << database_design
cs_databases_req.save

# Economics
economics = Major.create(title: "Economics")
economics_maths_req = Requirement.new(name: "Mathematics", major: economics)
economics_maths_req.courses << calculus_1
economics_maths_req.save

intro_microeconomics = Course.create(title: "Introductory Microeconomics")
intro_macroeconomics = Course.create(title: "Introductory Macroeconomics")
intermediate_micro = Course.create(title: "Intermediate Microeconomics")
intermediate_macro = Course.create(title: "Intermediate Macroeconomics")

economics_intro_reqs = Requirement.new(name: "Introductory Courses", major: economics)
economics_intro_reqs.courses << intro_microeconomics
economics_intro_reqs.courses << intro_macroeconomics
economics_intro_reqs.save

economics_intermediate_reqs = Requirement.new(name: "Intermediate Courses", major: economics)
economics_intermediate_reqs.courses << intermediate_micro
economics_intermediate_reqs.courses << intermediate_macro
economics_intermediate_reqs.save

# Philosophy
philosophy = Major.create(title: "Philosophy")

analytic_req = Requirement.new(name: "Analytic", major: philosophy)
analytic_req.courses << Course.create(title: "Formal Logic")
analytic_req.courses << Course.create(title: "Philosophy of language")
analytic_req.save