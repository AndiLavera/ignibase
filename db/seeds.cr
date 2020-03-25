require "../config/application"
# Test user for auth

User.create(email: "admin@example.com", password: "password")
