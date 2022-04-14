# frozen_string_literal: true

class RoomsController < ApplicationController
  include ActionView::RecordIdentifier
  before_action :find_hotel!
  before_action :find_room!, only: %i[edit update destroy show]

  def update
    if @room.update room_update_params
      flash[:success] = 'Room saved'
      redirect_to hotel_path(@hotel, anchor: dom_id(@room))
    else
      render :edit
    end
  end

  def edit
    @room = @hotel.rooms.find params[:id]
  end

  def new
    @room = @hotel.rooms.build
  end

  def create
    # current_user.hotels.build hotel_params
    @room = @hotel.rooms.build room_create_params
    if @room.save
      flash[:success] = 'Room created!'
      redirect_to hotel_path(@hotel, anchor: "room-#{@room.id}")
    else
      @pagy, @rooms = pagy @hotel.rooms.order(created_at: :desc)
      render :new
    end
  end

  def show
    @room = @hotel.rooms.find params[:id]
  end

  def destroy
    @room = @hotel.rooms.find params[:id]
    @room.destroy
    flash[:success] = 'Room deleted!'
    redirect_to hotel_path(@hotel)
  end

  private

  def room_create_params
    params.require(:room).permit(:price_per_night, :room_type, :link_img, :bed_type, :number_of_people, :booking_type,
                                 :number_of_beds, :food, :comforts, images: []).merge(user_id: current_user.id)
  end

  def room_update_params
    params.require(:room).permit(:price_per_night, :room_type, :link_img, :bed_type, :number_of_people, :booking_type,
                                 :number_of_beds, :food, :comforts, images: [])
  end

  def find_hotel!
    @hotel = Hotel.find params[:hotel_id]
  end

  def find_room!
    @room = @hotel.rooms.find params[:id]
  end
end
