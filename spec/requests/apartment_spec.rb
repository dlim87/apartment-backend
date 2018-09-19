require 'rails_helper'

describe "Apartment API" do
  it "gets a list of apartments" do
    
    get '/apartments'
    json=JSON.parse(response.body)
    puts json
    expect(response).to be_success
    expect(json.length).to eq 1
  end
end
