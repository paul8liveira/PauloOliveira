# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Language.destroy_all
Language.create([
	{
		name: "ASP.NET MVC"
	},
	{
		name: "Android"
	},
	{
		name: "PHP"
	},
	{
		name: "Ruby on Rails"
	},
	{
		name: "Genexus 9"
	}	
])
p "Created #{Language.count} language(s)"