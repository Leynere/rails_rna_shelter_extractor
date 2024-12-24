require 'rails_helper'

RSpec.describe "Scrap test", type: :request do
  it "Get" do
    get "/api/scrap/scrap-test"
    expect(response.body).to include('{"data":"Page Title:')
  end
end
