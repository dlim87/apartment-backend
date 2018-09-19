class ApartmentsController < ApplicationController
  def index
    apartments = Apartment.all
    render json:apartments
  end

  def create
    apartment = Apartment.create(apartment_params)
    render json: apartment
  end

  def apartment_params
    params.require(:apartment).permit(:address_1, :address_2, :city, :post_code, :state, :country, :manager_name, :manager_number, :manager_time)
  end

end
