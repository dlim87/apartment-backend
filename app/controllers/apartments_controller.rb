class ApartmentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  def index
    apartments = Apartment.all
    render json:apartments
  end

  def create
    apartment = Apartment.create(apartment_params)
    render json: apartment
  end

  def show
    apartment = Apartment.find_by(id:params[:id])
    # puts apartment
    render json: apartment
  end

  def update
    apartment = Apartment.find_by(id:params[:id])
    apartment.update(apartment_params)
    render json: apartment
  end

  def destroy
    apartment = Apartment.find_by(id:params[:id])
    apartment.destroy
  end
  def apartment_params
    params.require(:apartment).permit(:address_1, :address_2, :city, :post_code, :state, :country, :manager_name, :manager_number, :manager_time)
  end

end
