json.status 200
json.array! "keys", keys do |json, key|
  json.key key.key
  json.app_id app.uuid
  json.environment key.environment
  json.created_at key.created_at
end