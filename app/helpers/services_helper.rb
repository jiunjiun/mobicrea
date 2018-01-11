module ServicesHelper
  def more_services service
    service_furniture_ids = service.service_furnitures.pluck(:id)

    if Product.where(collection_id: service_furniture_ids).count > 0
      service_furniture_ids = service.service_furnitures.pluck(:id)
      Product.where(collection_id: service_furniture_ids).order("RAND()").limit(8)
    else
      service_furniture_ids = ServiceFurniture.pluck(:id)
      Product.where(collection_id: service_furniture_ids).order("RAND()").limit(8)
    end
  end
end
