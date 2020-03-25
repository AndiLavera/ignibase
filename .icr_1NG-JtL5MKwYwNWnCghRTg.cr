require "./config/application"










def __icr_exec__
  u = User.find(1)
  u.apps if u
  u = User.new({email: "andrew2@gmail.com"})
  u.password = "andrew910"
  u.save
  AppUsers.all
  AppUsers.all.ids
  AppUsers.all.last
end

puts "|||YIH22hSkVQN|||#{__icr_exec__.inspect}"