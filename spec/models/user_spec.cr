require "../spec_helper"

describe User do
  context "should create a new user" do
    it "from json" do
      password = "Password123"
      json = {
        "email"          => "test@email.com",
        "password"       => password,
        "firstName"      => "igni",
        "lastName"       => "base",
        "termsOfService" => true,
      }.to_json
      user = User.from_json(json)
      user.password = password

      user.save.should eq(true)
    end
  end
end
