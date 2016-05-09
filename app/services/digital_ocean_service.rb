class DigitalOceanService
  attr_reader :client
  attr_reader :droplet_repository

  def initialize
    @client = DropletKit::Client.new(access_token: ENV['DIGITAL_OCEAN_TOKEN'])
  end

  def fetch_and_save_droplets
    client.droplets.all.each do |droplet|
      droplet_repository.find_or_create_droplet(data: droplet)
    end
  end

  def droplet_repository
    @droplet_repository ||= DropletRepository.new
  end
end
