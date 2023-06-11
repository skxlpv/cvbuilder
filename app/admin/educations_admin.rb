Trestle.resource(:educations) do
  menu do
    item :educations, icon: "fa fa-star"
  end
  
  table do
    column :location
    column :degree
    column :specialization
    column :start_date
    column :end_date
    column :created_at, align: :center
    actions
  end

  form do |education|
    text_field :location, label: 'Educational institution'
    select :degree, Education.enum_options
    text_field :specialization
    date_field :start_date
    date_field :end_date
  
    row do
      col { datetime_field :updated_at }
      col { datetime_field :created_at }
    end
  end
end
