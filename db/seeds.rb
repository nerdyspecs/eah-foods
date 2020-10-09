# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if User.all.empty?
	User1 = User.new(:email=>"user1@mail.com", :password=>"user1password" , :first_name => "User 1", :last_name => "Doe", :mobile=>"0123414029")
	User2 = User.new(:email=>"user2@mail.com", :password=>"user2password" , :first_name => "User 2", :last_name => "Reeds", :mobile=>"0123456978")
	if User1.save
		puts "User1 created"
		AuditLog.create(:user=>"teckhong", :action=>"seeding user1 as regualar user", :description=>"")
	end
	if User2.save
		puts "User2 created"
		AuditLog.create(:user=>"teckhong", :action=>"seeding user2 as regualar user", :description=>"")
	end
end

if Store.all.empty?
	users = User.all
	users.each_with_index do |user,index|
		store = Store.new(
			:user_id => user.id, :organisation_name => "Store #{index}", :unit => "unit #{index}", :street_address =>"street #{index}" ,:postal_code => "postal #{index}", :city =>"city #{index}", :state=>"state #{index}", :country=>"Malaysia"
			)
		if store.save
			puts "Store #{index} created"
			AuditLog.create(:user=>"teckhong", :action=>"seeding store #{index} for #{user.email}", :description=>"")
		end
	end
end

if Item.all.empty?
	stores = Store.all
	stores.each_with_index do |store,index|
		item = Item.new(:store_id => store.id, :title=>"Item #{index}", :description=>"This is description for store #{index}")
		if item.save
			puts "Item created"
			AuditLog.create(:user=>"teckhong", :action=>"seeding item for store #{store.id}", :description=>"")
		end
	end
end