
# User.destroy_all
# Item.destroy_all
#user seeds
u1 = User.create!(username: "Bob", first_name: "bob", last_name: "bobby", email: "bob@bob.com", password: "password", password_confirmation: "password")
u2 = User.create!(username: "Aaa",first_name: "Aaa", last_name: "zzz", email: "aaa@aaa.com", password: "password", password_confirmation: "password")
u3 = User.create!(username: "Imran", first_name: "Imran", last_name: "imran", email: "imran@imran.com", password: "password", password_confirmation: "password")

i1 = Item.create!(name: "Something", description: "blah blah blah", value: 10, image: "http://www.fillmurray.com/300/300", user_id: u1.id)
i2 = Item.create!(name: "Something else", description: "blah blah blah", value: 10, image: "http://www.fillmurray.com/300/300", user_id: u1.id)
i3 = Item.create!(name: "A tree", description: "blah blah blah", value: 10, image: "http://www.fillmurray.com/300/300", user_id: u2.id)
i4 = Item.create!(name: "A Hot Dog", description: "blah blah blah", value: 10, image: "http://www.fillmurray.com/300/300", user_id: u3.id)
i5 = Item.create!(name: "A Piece of Paper", description: "blah blah blah", value: 10, image: "http://www.fillmurray.com/300/300", user_id: u3.id)
