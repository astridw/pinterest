class PinsController < ApplicationController
  before_action :find_pin, except: [:create, :new, :index]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @pins = Pin.all.order("created_at desc")
  end

  def create
    @pin = current_user.pins.build(pin_params)
    if @pin.save
      redirect_to @pin, notice: "Your pin was successfully saved!"
    else
      render :new
    end
  end

  def new
    @pin = current_user.pins.build
  end

  def show
  end


  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: "Your pin was sucessfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @pin.destroy
    redirect_to root_path, notice: "Your pin was sucessfully deleted"
  end

  def upvote
    @pin.upvote_by current_user
    redirect_to :back
  end

  private

  def pin_params
    params.require(:pin).permit(:title,:description,:photo)
  end

  def find_pin
    @pin = Pin.find(params[:id])
  end

end
