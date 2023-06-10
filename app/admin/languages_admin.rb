Trestle.resource(:languages) do
  menu do
    item :languages, icon: "fa fa-star"
  end
  def to_label
    "#{name}, #{level}"
  end

  table do
    column :name
    column :level
    column :created_at, align: :center
    actions
  end

  form do |language|
    text_field :name
    # select :level, Language.enum_levels_options
    
    row do
      col { datetime_field :updated_at }
      col { datetime_field :created_at }
    end
  end
end
