require "./spec_helper"
require "../../src/models/app_user.cr"

describe AppUser do
  Spec.before_each do
    AppUser.clear
  end
end
