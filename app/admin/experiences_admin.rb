Trestle.resource(:experiences) do
  menu do
    item :experiences, icon: "fa fa-star"
  end

  table do
    column :title
    column :project_description
    column :commercial
    column :created_at, align: :center
    actions
  end

  form do |experience|
    text_field :title
    text_area :project_description
    check_box :commercial, default: false

    date_field :start_date
    date_field :end_date
  
    row do
      col { datetime_field :updated_at }
      col { datetime_field :created_at }
    end
  end
end
