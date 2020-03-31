json.code 400
json.message "Invalid account credentials."
json.request_params do |json|
  json.app_id resource_params["app_id"]
  json.email resource_params["email"]
  json.password resource_params["password"]
end