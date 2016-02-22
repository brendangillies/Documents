# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first
#
companies = Company.create([
 	{id: 1, name: "BSD Inc", company_type: "Owner"},
	{id: 100, name: "TransCanada", company_type: "SM"},
	{name: "SuperVendor", company_type: "EPC"},
	{name: "Fluor", company_type: "EPC"},
	{name: "Jim's Pipeline", company_type: "N"},
	{name: "Steve's Steel", company_type: "V"}])

projects = Project.create([
	{id: 1, project: "VendorDocs", is_active: 1,
	date_opened: Date.new(2016, 01, 01), company_id: 1},
	{project: "KeystoneXL", is_active: 1,
	date_opened: Date.new(2015, 06, 01), company_id: 100}])

users = User.create([
	{first_name: "user", last_name: "McYeezy", email: "user@example.com",password: "password"},
	{first_name: "Ben", last_name: "Reeves", email: "breeves997@gmail.com",password: "password"},
	{first_name: "Brendan", last_name: "GayBoy", email: "brendan@example.com",password: "password"}])
