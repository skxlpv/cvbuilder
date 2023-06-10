Trestle.resource(:technologies) do
  menu do
    item :technologies, icon: "fa fa-star"
  end

  search do |query|
    if query
      collection.where(
        "name ILIKE :query OR 
        tech_type = :tech_type", 
        query: "%#{query}%", 
        tech_type: Technology.tech_types[query.to_sym]
      )
    else
      collection
    end
  end
  
  table do
    column :name
    column :description, sort: false
    column :created_at, align: :center
    column :tech_type
    actions
  end
  
  form do |technology|
    select :tech_type, Technology.enum_options
    text_field :name
    text_field :description

    row do
      col { datetime_field :updated_at }
      col { datetime_field :created_at }
    end
  end
end
