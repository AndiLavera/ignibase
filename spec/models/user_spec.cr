require "./spec_helper"
require "../../src/models/user"

describe User do
  it "should create a new top level user" do
    email = "user_spec_01#{rand(1..100)}@gmail.com"
    user = User.new_top_level({
      "email"          => email,
      "password"       => "Password123",
      "firstName"      => "igni",
      "lastName"       => "base",
      "termsOfService" => true,
    })

    user.save.should eq(true)
    user.id.should_not be_nil
    user.password_digest.should_not be_nil
    user.email.should eq(email)
    user.first_name.should eq("igni")
    user.last_name.should eq("base")
    # TODO: user.terms_of_service.should eq(true)
  end
end
