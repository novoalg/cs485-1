# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create(name: "None", description: "No Permissions - Average User")
Role.create(name: "Read", description: "Read-only access to information")
Role.create(name: "Edit", description: "Allowed to edit existing information")
Role.create(name: "Add", description: "Allowed to create new items, categories, etc.")
Role.create(name: "Delete", description: "Allowed to remove information from the application.")

EmailTemplate.create(
  :content => "<p><span style=\"color:#FF0000\">Welcome to Silver and Stones!</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><font color=\"#006400\">Happy shopping!</font></p>\r\n",
  :email_type => "Welcome Email",
  :subject => "Welcome to Silver & Stones Gallery!"
)

EmailTemplate.create(
  :content => "<p><span style=\"color:#FF0000\">Welcome to Silver and Stones!</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><font color=\"#006400\">Happy shopping!</font></p>\r\n",
  :email_type => "Mass Email",
  :subject => "A Message From Silver & Stones Gallery"
)

User.create(email: "support@silverandstones.gallery", password: "administrator", password_confirmation: "administrator", role_id: 5, can_send_emails: true)

Headline.create(text: "This is a breaking news headline!")