class ActionRepository
  ACTION_STATUS_IN_PROGRESS = 'in-progress'.freeze

  def update_status(action_id:, status:)
    Action.update(action_id, status: status)
  end

  def find_all_pending
    Action.where(status: ACTION_STATUS_IN_PROGRESS)
  end

  def create_or_update(droplet_id:, data:)
    Action.first_or_initialize(
      external_id: data.id
    ).update(
      droplet_id: droplet_id,
      action_type: data.type,
      status: data.status,
      started_at: DateTime.iso8601(data.started_at),
      completed_at: DateTime.iso8601(data.started_at),
    )
  end
end
