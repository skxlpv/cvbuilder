Trestle.resource(:projects) do
  menu do
    item :projects, icon: "fa fa-star"
  end

  search do |query|
    if query
      collection.where(
        "title ILIKE ? OR 
        description ILIKE ?",
        "%#{query}%", "%#{query}%"
      )
    else
      collection
    end
  end

  # View records
  table do
    column :title
    column :description
    column :deadline
    column :created_at
    actions
  end

  # Update record
  form do |project|
    text_field :title
    text_field :description
    date_field :deadline
    select :technologies_ids, Technology.all.map{|tech_type| [tech_type.name, tech_type.id]}, {label: 'Technology stack'}, { multiple: true}
    select :workers_ids, Worker.all.map { |worker| ["#{worker.user.first_name} #{worker.user.surname}", worker.id] }, { label: 'Workers' }, { multiple: true }

    row do
      col { datetime_field :updated_at }
      col { datetime_field :created_at }
    end
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # params do |params|
  #   params.require(:project).permit(:name, ...)
  # end
end
