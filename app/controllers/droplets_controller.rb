class DropletsController < ApplicationController
  protect_from_forgery :except => [:update]

  def update
    @droplet = DigitalOceanService.new.change_status(
      droplet_id: params[:id],
      status: params[:status]
    )
    render json: @droplet
  end
end
