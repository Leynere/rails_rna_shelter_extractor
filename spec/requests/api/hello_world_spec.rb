require 'rails_helper'

RSpec.describe "Hello world", type: :request do
  it "Get" do
    get "/api/hello-world"
    expect(response.body).to match('{"data":"Hello World!"}')
  end
end
