class DigitalOceanService
  attr_reader :client
  attr_reader :droplet_repository

  delegate :droplet_actions, to: :client

  def initialize
    @client = DropletKit::Client.new(access_token: ENV['DIGITAL_OCEAN_TOKEN'])
  end

  def fetch_and_save_droplets
    client.droplets.all.each do |droplet|
      droplet_repository.create_or_update_droplet(data: droplet)
    end
  end

  def change_status(droplet_id:, status:)
    droplet = Droplet.find(droplet_id)
    if status == 'active'
      power_on(droplet: droplet)
    else
      shutdown(droplet: droplet)
    end
  end

  def power_on(droplet:)
    droplet_actions.power_on(droplet_id: droplet.external_id)
  end

  def shutdown(droplet:)
    shutdown = droplet_actions.shutdown(droplet_id: droplet.external_id)
  end

  def droplet_repository
    @droplet_repository ||= DropletRepository.new
  end

  private

  def update_status(droplet_id, status)
    droplet_repository.update_status(
      droplet_id: droplet_id,
      status: status
    )
  end
end
