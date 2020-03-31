json.status 200
json.array! "apps", apps do |json, app|
  json.name app.name
  json.id app.uuid
  json.created_at app.created_at
end