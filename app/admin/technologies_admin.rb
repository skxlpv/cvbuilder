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

  # Customize the form fields shown on the new/edit views.
  
  form do |technology|
    select :tech_type, Technology.enum_options
    text_field :name
    text_field :description

    row do
      col { datetime_field :updated_at }
      col { datetime_field :created_at }
    end
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:technology).permit(:name, ...)
  # end
end
