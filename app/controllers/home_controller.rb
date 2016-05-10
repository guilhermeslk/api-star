class HomeController < ApplicationController
  def index
    DigitalOceanService.new.fetch_and_save_droplets
    @droplets = DropletRepository.new.find_all
  end
end
