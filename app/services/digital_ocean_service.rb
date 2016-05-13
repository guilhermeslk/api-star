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
    droplet = droplet_repository.find_by_id(droplet_id)
    if status == 'active'
      power_on(droplet: droplet)
    else
      shutdown(droplet: droplet)
    end
    droplet
  end

  def check_pending_actions
    action_repository.find_all_pending.map do |action|
      remote_action = retrieve_action(action: action)
      action = update_action(action.id, remote_action.status)
      {
        droplet: action.droplet,
        action: action,
      }
    end
  end

  def power_on(droplet:)
    action = droplet_actions.power_on(droplet_id: droplet.external_id)
    action_repository.create_or_update(droplet_id: droplet.id, data: action)
  end

  def shutdown(droplet:)
    action = droplet_actions.shutdown(droplet_id: droplet.external_id)
    action_repository.create_or_update(droplet_id: droplet.id, data: action)
  end

  def retrieve_action(action:)
    droplet_actions.find(
      droplet_id: action.droplet.external_id,
      id: action.external_id
    )
  end

  def droplet_repository
    @droplet_repository ||= DropletRepository.new
  end

  def action_repository
    @action_repository ||= ActionRepository.new
  end

  private

  def update_status(droplet_id, status)
    droplet_repository.update_status(
      droplet_id: droplet_id,
      status: status
    )
  end

  def update_action(action_id, status)
    action_repository.update_status(
      action_id: action_id,
      status: status
    )
  end
end
