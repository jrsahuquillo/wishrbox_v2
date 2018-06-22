# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

usernames = ['Sahu', 'Carlos', 'Alvaro', 'Filipa', 'Daichi', 'Simon', 'Miguel Angel', 'Juan Pablo', 'Diana', 'Mariano']
domain = ['gmail.com', 'mail.com', 'hotmail.com', 'yahoo.es']
wishes = ['iPhone 7', 'iPad 2 Air', 'MackBook Pro', 'Apple TV', 'MacBook Air', 'Apple Watch', 'Earpods', 'Apple Music', 'iPod touch', 'Mac mini' ]

10.times do |i|
	username = usernames[i]
	wish = wishes[i]

	user = User.create!({
		username: username,
		email: username.gsub(/\s+/, "").downcase+"@"+domain[rand(domain.length)],
		password: '12345678',
		password_confirmation:'12345678',
		})

	user.wishes.create!({
		title: wish,
		description: "The very best #{wish} ever in the world",
		})

end
