require "../spec_helper"

describe User do
  it "should create a new top level user" do
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
    user.id.should_not be_nil
    user.password_digest.should_not be_nil
    user.email.should eq(email)
    user.first_name.should eq("igni")
    user.last_name.should eq("base")
    # TODO: user.terms_of_service.should eq(true)
  end
end
