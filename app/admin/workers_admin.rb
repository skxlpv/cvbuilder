Trestle.resource(:workers) do
  menu do
    item :workers, icon: "fa fa-star"
  end

  search do |query|
    if query
      collection.joins(:user).where(
        "users.first_name ILIKE ? OR 
        users.surname ILIKE ? OR 
        users.email ILIKE ? OR
        users.age ILIKE ?", 
        "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
    else
      collection
    end
  end


  table do
    column :user_id, sort: :age, header: 'First name' do |worker|
      worker.user.first_name
    end
    column :user_id, sort: :age, header: 'Surname' do |worker|
      worker.user.surname
    end
    column :user_id, sort: :age, link: true, header: 'Email' do |worker|
      worker.user.email
    end
    column :user_id, sort: :age, header: 'Age' do |worker|
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


  controller do
    def show
      toolbar(:primary) do |t|
        t.link("Generate PDF", instance, action: :generate_pdf, method: :post, icon: "fa fa-check")
      end
    end

    def generate_pdf
      # TODO:
      # 1. Fill the template with all the user info
      # 2. Download html template
    end
  end

  routes do
    post :generate_pdf, on: :member
  end  
end
