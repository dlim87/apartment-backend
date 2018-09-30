require 'rails_helper'

describe "Apartment API" do
  it "gets a list of apartments" do
    Apartment.create(address_1:"1234 union cowork", city:"San Diego", post_code:12345, state:"CA", country:"USA", manager_name:"Me", manager_number:123456789, manager_time:"never")
    get '/apartments'
    json=JSON.parse(response.body)
    # puts json
    expect(response).to be_successful
    expect(json.length).to eq 1
  end

  it "can create an entry" do
    test_apartment = {
      apartment:{
        address_1:"1234 union cowork", city:"San Diego", post_code:12345, state:"CA", country:"USA", manager_name:"Me", manager_number:123456789, manager_time:"never"
      }
    }
    #add apartment
    post '/apartments', params: test_apartment
    json=JSON.parse(response.body)
    # puts json
    expect(response).to be_successful
    new_apartment=Apartment.first
    expect(new_apartment.manager_name).to eq('Me')
  end

  it "can view a single entry" do

    apartment = Apartment.create(address_1:"1234 union cowork", city:"San Diego", post_code:12345, state:"CA", country:"USA", manager_name:"Me", manager_number:123456789, manager_time:"never")
    Apartment.create(address_1:"2", city:"San Diego", post_code:12345, state:"CA", country:"USA", manager_name:"Me", manager_number:123456789, manager_time:"never")
    get "/apartments/#{apartment.id}"
    json=JSON.parse(response.body)
    # puts json
    expect(response).to be_successful
    expect(json['address_1']).to eq "1234 union cowork"
    # expect(response['manager_name']).to be "Me"
  end

  it "can destroy a single entry" do
    apartment = Apartment.create(address_1:"1234 union cowork", city:"San Diego", post_code:12345, state:"CA", country:"USA", manager_name:"Me", manager_number:123456789, manager_time:"never")

    get '/apartments'
    json=JSON.parse(response.body)
    expect(response).to be_successful
    expect(json.length).to eq 1

    delete "/apartments/#{apartment.id}"

    get '/apartments'
    json=JSON.parse(response.body)
    expect(response).to be_successful
    expect(json.length).to eq 0
  end

  it "can update an entry" do
    apartment = Apartment.create(address_1:"1234 union cowork", city:"San Diego", post_code:12345, state:"CA", country:"USA", manager_name:"Me", manager_number:123456789, manager_time:"never")
    # puts apartment
    get "/apartments/#{apartment.id}"
    json=JSON.parse(response.body)
    # puts json
    expect(response).to be_successful
    expect(json['manager_name']).to eq "Me"
    owner = { apartment:{ manager_name:"You"}}
    patch "/apartments/#{apartment.id}", params:owner
    json=JSON.parse(response.body)
    # puts json
    expect(response).to be_successful
    expect(json['manager_name']).to eq "You"
  end

  
end
