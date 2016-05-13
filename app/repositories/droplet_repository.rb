class DropletRepository
  def find_all
    Droplet.all.order(:name)
  end

  def find_by_id(droplet_id)
    Droplet.find(droplet_id)
  end

  def update_status(droplet_id:, status:)
    Droplet.update(droplet_id, status: status)
  end

  def create_or_update_droplet(data:)
    Droplet.first_or_initialize(
      external_id: data.id
    ).update(
      name: data.name,
      region_slug: data.region.slug,
      memory: data.memory,
      disk: data.disk,
      vcpus: data.vcpus,
      status: data.status,
      image_name: data.image.name
    )
  end
end
