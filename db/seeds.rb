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
  :content => "<h2><span style=\"font-family:arial,helvetica,sans-serif\">Welcome to Silver &amp; Stones! </span></h2>\r\n\r\n<p>If you have opted in to our mailing list, we&#39;ll keep you in the loop!<br />\r\nIf you did not elect to receive mail from us, this is the last you&#39;ll receive.</p>\r\n\r\n<p>Regardless, we hope we can be of service to you in some way.</p>\r\n\r\n<p>Let us know if you have any questions!</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Sincerely,</p>\r\n\r\n<p><em>Silver &amp; Stones Gallery Staff</em></p>\r\n",
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