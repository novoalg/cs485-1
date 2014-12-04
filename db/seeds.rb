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
Role.create(name: "Add", description: "Allowed send emails and create new data.")
Role.create(name: "Delete", description: "Allowed to remove information from the application.")

EmailTemplate.create(
  :content => "<h2><span style=\"font-family:arial,helvetica,sans-serif\">Welcome to Silver &amp; Stones! </span></h2>\r\n\r\n<p>If you have opted in to our mailing list, we&#39;ll keep you in the loop!<br />\r\nIf you did not elect to receive mail from us, this is the last you&#39;ll receive.</p>\r\n\r\n<p>Regardless, we hope we can be of service to you in some way.</p>\r\n\r\n<p>Let us know if you have any questions!</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Sincerely,</p>\r\n\r\n<p><em>Silver &amp; Stones Gallery Staff</em></p>\r\n",
  :email_type => "Welcome Email",
  :subject => "Welcome to Silver & Stones Gallery!"
)

User.create(email: "support@silverandstones.gallery", password: "administrator", password_confirmation: "administrator", role_id: 5, receive_emails: true)

Headline.create(text: "This is a breaking news headline!")

StaticText.create(page: "static_pages/index", location: "description", text: "Silver & Stones Gallery is the perfect place to shop for special gifts or treasures for your home. We pride ourselves on our large collection of locally produced artwork, artisan-made jewelry, and fine decor. We stock many specialty items that you won't be likely to find anywhere else! Our friendly staff and warm, welcoming store environment ensure an enjoyable shopping experience.")
StaticText.create(page: "static_pages/index", location: "panel1", text: "We get new items in frequently, so there will always be something new and interesting to enjoy in your home!")
StaticText.create(page: "static_pages/index", location: "panel2", text: "Our stock of artisan jewelry is of the finest quality, produced by masters of their trade.")
StaticText.create(page: "static_pages/index", location: "panel3", text: "If you've got an eye for fashion, you know how important a unique style is. We have apparel you won't find anywhere else!")
StaticText.create(page: "static_pages/index", location: "panel4", text: "We offer a wide variety of tasy treats, from snacks and dips to handmade candy.")
StaticText.create(page: "static_pages/index", location: "panel5", text: "Sometimes it can be hard to find a unique gift. Our unique stock means you're sure to find that special something.")
StaticText.create(page: "static_pages/index", location: "panel6", text: "Our artists provide some of their best work for us, which we're happy to pass along to you.")
StaticText.create(page: "static_pages/about", location: "first box", text: "We're locally and family owned, so we don't have to compromize on quality. There are few better places to live than Eau Claire. The area is vibrant and full of creative people! The creative attitude drives us, and we are proud to offer a sampling of the region's finest works!")
StaticText.create(page: "static_pages/about", location: "second box", text: "We love what we do.")
StaticText.create(page: "static_pages/contact", location: "blurb", text: "We would love to hear from you. You can reach out to us and one of our team members will get back to you as soon as possible. Otherwise, you're welcome to call or stop in - we'd be more than happy to help you in person!")
