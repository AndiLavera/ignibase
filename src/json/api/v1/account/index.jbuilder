json.code !!(account) ? 200 : 400
if account.nil?
  json.message "Could not verify user."
  json.request_params do |json|
    json.app_id resource_params["app_id"]
    json.email resource_params["email"]
    json.password resource_params["password"]
  end
else
  json.message "ok"
  json.account do |json|
    json.id account.id
    json.email account.email
    #json.password account.password
    json.first_name account.first_name
    json.last_name account.last_name
  end
end