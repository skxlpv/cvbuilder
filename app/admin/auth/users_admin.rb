Trestle.resource(:users, model: User, scope: Auth) do
  menu do
    group :configuration, priority: :last do
      item :users, icon: "fas fa-users"
    end
  end

  search do |query|
    if query
      collection.where(
        "first_name ILIKE ? OR 
        surname ILIKE ? OR 
        email ILIKE ? OR 
        age ILIKE ?",
        "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%"
      )
    else
      collection
    end
  end

  table do
    column :avatar, header: false do |user|
      avatar_for(user)
    end
    column :first_name
    column :surname
    column :age
    column :admin
    column :email, link: true
    actions do |a|
      a.delete unless a.instance == current_user
    end
  end

  form do |user|
    text_field :first_name
    text_field :surname
    number_field :age
    text_field :email

    row do
      col(sm: 6) { password_field :password }
      col(sm: 6) { password_field :password_confirmation }
    end
    check_box :admin
  end

  controller do
    def create
      @user = User.new(params.require(:user).permit(
        :first_name, :surname, :email, :password, :password_confirmation, :age
        )
      )
  
      if @user.save
        Worker.create(user: @user)
      else
        flash[:error] = "User creation failed"
        raise ActiveRecord::Rollback
      end
    end
  end
end
