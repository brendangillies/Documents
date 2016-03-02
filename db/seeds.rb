# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first
#
#
#############   CLEAR ALL RECORDS BEFORE SEEDING############
ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  next if table == 'schema_migrations'

  # MySQL and PostgreSQL
  ActiveRecord::Base.connection.execute("TRUNCATE #{table}")

  # SQLite
  # ActiveRecord::Base.connection.execute("DELETE FROM #{table}")
end

#############################################################
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
	{id: 2, project: "Northern Gateway", is_active: 1,
	date_opened: Date.new(2016, 01, 01), company_id: 1},
	{project: "KeystoneXL", is_active: 1,
	date_opened: Date.new(2015, 06, 01), company_id: 100}])

users = User.create([
	{first_name: "user", last_name: "McYeezy", email: "user@example.com",password: "password"},
	{first_name: "Ben", last_name: "Reeves", email: "breeves997@gmail.com",password: "password"},
	{first_name: "Brendan", last_name: "GayBoy", email: "brendan@example.com",password: "password"}])

project_users = ProjectUser.create([
	{user_id: 1, project_id: 1},
	{user_id: 1, project_id: 2}])

master_pos = MasterPo.create([
	{id: 1, project_id: 1, po_num: "AB494980085", is_active: 1},
	{id: 2, project_id: 1, po_num: "AB494980086", is_active: 1},
	{id: 3, project_id: 2, po_num: "AB494980087", is_active: 1},
	{id: 4, project_id: 2, po_num: "AB494980088", is_active: 1},
	{id: 5, project_id: 2, po_num: "AB494980089", is_active: 1}])

items = Item.create([
	{id: 1, master_po_id: 1, line_item_num: 1, line_item_desc: "3"" Gizmo", docs_required: 3,
	price: 100, status: "Pending"},
	{id: 2, master_po_id: 1, line_item_num: 2, line_item_desc: "4"" Gizmo", docs_required: 1,
	price: 100, status: "Pending"},
	{id: 3, master_po_id: 1, line_item_num: 3, line_item_desc: "Steel bar", docs_required: 0,
	price: 100, status: "Approved"},
	{id: 4, master_po_id: 2, line_item_num: 1, line_item_desc: "Banana hammock", docs_required: 2,
	price: 100, status: "Approved"},
	{id: 5, master_po_id: 2, line_item_num: 2, line_item_desc: "Mike Tyson", docs_required: 2,
	price: 100, status: "Pending"},
	{id: 6, master_po_id: 3, line_item_num: 1, line_item_desc: "Toolbox", docs_required: 1,
	price: 100, status: "Pending"}])
