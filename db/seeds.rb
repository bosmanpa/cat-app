# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#Chicago Neighborhoods: Lincoln Park, Chinatown, River North, Logan Square, Englewood, Austin, Riverdale, Humboldt Park, Hyde Park, South Chicago, Wicker Park, West Englewood, Oakland,  
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



User.create([{name: "Herta Beatty"}, {name: "Della Hoeger"}, {name: "Mr. In Von"}, {name: "Loraine Champlin"}, {name: "Salena Fay"}])

Tag.create([{name: "fuzzy"}, {name: "cuddly"}, {name: "kid-friendly"}, {name: "bad with crowds"}, {name: "friendly"}, {name: "goofy"}])

Cat.create([{owner_id: 1, name: "Angel", neighborhood: "Lincoln Park", price: 100.00, breed: "Khao Manee", tag_ids: [1,2,5]}, {owner_id: 2, name: "Oscar", breed: "Aegean", price: 57.20, neighborhood: "Humboldt Park", tag_ids: [1,5,6]}, {owner_id: 3, name: "Missy", price: 120.00, breed: "Singapura", neighborhood: "Oakland", tag_ids: [1,5]}, {owner_id: 4, name: "Felix", breed: "British Semipi-longhair", price: 50.00, neighborhood: "South Chicago"}, {owner_id: 5, name: "Shadow", breed: "Korat", neighborhood: "Humboldt Park", price: 67.50}])
Cat.create([{owner_id: 1, name: "Tiger", neighborhood: "Lincoln Park", price: 150.00, breed: "Maine Coon", tag_ids: [1,3,5]}, {owner_id: 1, name: "Charlie", breed: "Oregon Rex", price: 50.00, neighborhood: "Lincoln Park"}, {owner_id: 1, name: "Poppy", breed: "Burmilla", price: 50.00, neighborhood: "Lincoln Park"}])

Reservation.create([{cat_id: 1, renter_id: 3, date: DateTime.now}, {cat_id: 3, renter_id: 5, date: DateTime.now}, {cat_id: 2, renter_id: 2, date: DateTime.now}, {cat_id: 4, renter_id: 2, date: DateTime.now}])
Reservation.create([{cat_id: 1, renter_id: 5, date: DateTime.now}, {cat_id: 6, renter_id: 4, date: DateTime.now}, {cat_id: 7, renter_id: 2, date: DateTime.now}, {cat_id: 8, renter_id: 3, date: DateTime.now}])
Reservation.create([{cat_id: 1, renter_id: 6, date: DateTime.now}, {cat_id: 6, renter_id: 2, date: DateTime.now}, {cat_id: 7, renter_id: 5, date: DateTime.now}, {cat_id: 8, renter_id: 4, date: DateTime.now}])

CatReview.create(reservation_id: 1, rating: 4, review: "very good kitt")