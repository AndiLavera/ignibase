json.code 400
msg = ""
account.errors.each { |k, v| msg += "#{k} #{v} " }
json.message msg
json.request_params do |json|
  json.app_id resource_params["app_id"]
  json.email resource_params["email"]
  json.first_name resource_params["first_name"]
  json.last_name resource_params["last_name"]
  json.password resource_params["password"]
  json.password_confirmation resource_params["password_confirmation"]
end