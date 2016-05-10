class DropletRepository
  def find_all
    Droplet.all.order(:name)
  end

  def update_status(droplet_id:, status:)
    Droplet.update(droplet_id, status: status)
  end

  def find_or_create_droplet(data:)
    Droplet.create_with(
      name: data.name,
      region_slug: data.region.slug,
      memory: data.memory,
      disk: data.disk,
      vcpus: data.vcpus,
      status: data.status,
      image_name: data.image.name
    ).find_or_create_by(external_id: data.id)
  end
end
