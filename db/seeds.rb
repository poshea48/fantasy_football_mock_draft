# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Player.create({name: "Todd Gurley III", adp: 1, team: "LAR", position: "RB", bye: 12, drafted: false, my_player: false})
Player.create({name: "Kareem Hunt", adp: 11, team: "KC", position: "RB", bye: 12, drafted: false, my_player: false})

Player.all.each do |p|
  p.update(drafted: false, my_player: false)
end 
