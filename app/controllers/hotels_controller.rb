class HotelsController < ApplicationController

  before_action :find_hotel!, only: %i[show destroy edit update]

  # before_action :authenticate_user!, only: %i[:show, :index]

  # before_filter :authenticate_user!


  # def purge_avatar
  #   @hotel = Hotel.find params[:id]
  #   @hotel.avatar.purge
  #   flash[:success] = "Picture deleted!"
  #   redirect_back fallback_location: root_path
  # end


  def edit
  end


  def update
    if @hotel.update hotel_params
      flash[:success] = "Hotel saved"
      redirect_to hotel_path
    else
      render :edit
    end
  end 


  def show
    # @room = @hotel.rooms.build
    # @pagy, @rooms = pagy @hotel.rooms.order(created_at: :desc)
    # # @rooms = @hotel.rooms.order(created_at: :desc).page(params[:page]).per(2)

  end


  def destroy
    @hotel.destroy
    flash[:success] = "Hotel deleted!"
    redirect_to hotels_path
  end


  def index
    @hotels = Hotel.all

    # @pagy, @hotels = pagy Hotel.all
    # @hotels = Hotel.all.page params[:page]
  end


  def new
    @hotel = Hotel.new
  end


  def create
    @hotel = Hotel.new hotel_params
    if @hotel.save
      flash[:success] = "Hotel saved!"
      redirect_to hotels_path
    else
      render :new
    end
  end



  private

  def hotel_params
    params.require(:hotel).permit(:title, :stars, :address, :link_map, :pay_one, :pay_two, :rating, :about_hotel, :services, :extra, :contacts, :avatar)
  end


  def find_hotel!
    @hotel = Hotel.find params[:id]
  end
end