# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
user_list = [
  { name: "guest", email: "guest@example.com", password: "guest123"},
  { name: "user", email: "user@example.com", password: "user123"},
  { name: "manager", email: "manager@example.com", password: "manager123"},
  { name: "subadmin", email: "subadmin@example.com", password: "subadmin123"},
]
user_list.each do |u|
  nu = User.find_by(email: u[:email])
  if nu.nil?
    new_user = User.create(email: u[:email], name: u[:name], password: u[:password])
    puts "Created user #{u[:email]}."
    new_user.skip_confirmation!
  else
    puts "User #{u[:email]} was not created because it already existed."
    nu.confirm
    puts ".......... User #{u[:email]} was confirmed."
  end
end
# Create the MappingTypes
mappingtypes = [
  { name: "reply_text", description: "Will receive a text and return a text based on the content of the received text." },
  { name: "send_hours", description: "Will send hours and current open/closed status of the group." },
  { name: "send_location", description: "Will send the location of the group." },
  { name: "send_vcard", description: "Will send the contact information of the group." },
  { name: "call_back", description: "Will schedule a callback to call the sender." },
  { name: "external_function", description: "Will launch an external program or function." }
]
MappingType.delete_all
mappingtypes.each do |mt|
  MappingType.create(name: mt[:name], description: mt[:description])
  puts "Created MappingType: #{mt[:name]}"
end
