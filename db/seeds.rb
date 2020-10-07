# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if User.all.empty?
	User1 = User.new(:email=>"user1@mail.com", :password=>"user1password")
	User2 = User.new(:email=>"user2@mail.com", :password=>"user2password")
	if User1.save
		puts "User1 created"
		AuditLog.create(:user=>"teckhong", :action=>"seeding user1 as regualar user", :description=>"")
	end
	if User2.save
		puts "User2 created"
		AuditLog.create(:user=>"teckhong", :action=>"seeding user2 as regualar user", :description=>"")
	end
end

if Item.all.empty?
	Users = User.all
	Users.each_with_index do |user,index|
		item = Item.new(:user_id => user.id, :title=>"Item #{index}", :description=>"This is description for Item #{index}")
		if item.save
			puts "Item created"
			AuditLog.create(:user=>"teckhong", :action=>"seeding item for user #{user.id}", :description=>"")
		end
	end
end