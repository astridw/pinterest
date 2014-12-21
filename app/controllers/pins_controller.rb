class PinsController < ApplicationController

  def index
    @pins = Pin.all
  end

  def create
    @pin = Pin.new(pin_params)
  end

  def new
    @pin = Pin.new
  end

  def update
  end

  def destroy
  end

  private

  def pins_params
    params.require(:pin).permit(:title,:description)
  end

  def find_pins
  end

end
