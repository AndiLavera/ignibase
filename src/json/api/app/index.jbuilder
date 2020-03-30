json.status 200
json.apps do |json|
  apps.each do |app|
    json.name app.name
    json.id app.uuid
    json.created_at app.created_at
  end
end