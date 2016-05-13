class DropletsController < ApplicationController
  protect_from_forgery :except => [:update]

  def index
    DigitalOceanService.new.fetch_and_save_droplets
    @droplets = DropletRepository.new.find_all

    render json: {
      html: render_to_string(partial: 'shared/droplets_list.html.erb', locals: { droplets: @droplets })
    }
  end

  def update
    @droplet = DigitalOceanService.new.change_status(
      droplet_id: params[:id],
      status: params[:status]
    )
    render json: { droplet: @droplet, action: @droplet.actions.last }
  end
end
