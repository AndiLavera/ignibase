json.status 400
msg = ""
user.errors.each { |k, v| msg += "#{k} #{v} " }
json.message msg