require "./spec_helper"
require "../../src/models/api_key.cr"

describe ApiKey do
  Spec.before_each do
    ApiKey.clear
  end
end
