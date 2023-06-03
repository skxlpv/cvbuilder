Trestle.resource(:workers) do
  menu do
    item :workers, icon: "fa fa-star"
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :user_id, header: 'First name' do |worker|
      worker.user.first_name
    end
    column :user_id, header: 'Surname' do |worker|
      worker.user.surname
    end
    column :user_id, header: 'Email' do |worker|
      worker.user.email
    end
    column :user_id, header: 'Age' do |worker|
      worker.user.age
    end
    column :created_at, align: :center
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |worker|
    text_field :user_id, label: 'User id', readonly: true
    select :technologies_id, Technology.all.map { |tech_type| [tech_type.name, tech_type.id] }, { label: 'Technology stack' }, { multiple: true }
    
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
  #   params.require(:worker).permit(:name, ...)
  # end
end
