json.status 201
json.message "ok"
json.user do |json|
  json.id user.id
  json.email user.email
  #json.password account.password
  #json.full_name account.full_name
end