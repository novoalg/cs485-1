# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create(id: 0, name: "None", description: "No Permissions - Average User")
Role.create(id: 1, name: "Read", description: "Read-only access to information")
Role.create(id: 2, name: "Edit", description: "Allowed to edit existing information")
Role.create(id: 3, name: "Add", description: "Allowed to create new items, categories, etc.")
Role.create(id: 4, name: "Delete", description: "Allowed to remove information from the application.")

