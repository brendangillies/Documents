# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first
#
companies = Company.create([
	{id: 1, name: "BSD Inc", type: "Owner"},
	{id: 100, name: "TransCanada", type: "SM"},
	{name: "SuperVendor", type: "EPC"},
	{name: "Fluor", type: "EPC"},
	{name: "Jim's Pipeline", type: "N"},
	{name: "Steve's Steel", type: "V"},

projects = Project.create([
	{id: 1, project: "VendorDocs", is_active: 1,
	date_opened: Date.new(2016, 01, 01), company_id: 1}
	{project: "KeystoneXL", is_active: 1,
	date_opened: Date.new(2015, 06, 01), company_id: 100}

