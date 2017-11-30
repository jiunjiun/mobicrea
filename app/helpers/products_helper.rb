module ProductsHelper

  def product_breadcrumb product
    li = ''

    collection = product.collection
    li = content_tag(:li, product_breadcrumb_link(collection)) + li

    if collection.try(:parent).present?
      collection = collection.parent
      li = content_tag(:li, product_breadcrumb_link(collection)) + li

      case collection.collection_type
      when Collection::CollectionType::SERVICE
        li = content_tag(:li, link_to(t('service'), services_path)) + li
      end
    end

    # if collection.try(:parent).try(:parent).present?
    #   collection = collection.parent.parent
    #   li = content_tag(:li, product_breadcrumb_link(collection)) + li
    # end

    li
  end

  def product_breadcrumb_link collection
    link_to collection.name, product_breadcrumb_link_path(collection)
  end

  def product_breadcrumb_link_path collection
    case collection.collection_type
    when Collection::CollectionType::SERVICE
      service_path(collection)
    when Collection::CollectionType::SERVICE_FURNITURE
      service_service_furniture_path(collection.parent, collection)
    end
  end
end
