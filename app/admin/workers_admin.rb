require 'sidekiq/api'


Trestle.resource(:workers) do
  remove_action :destroy
  
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

    actions do |t, instance|
      pdf_filename = "cv_#{instance.id}.pdf"
      pdf_path = Rails.root.join('public', 'pdfs', pdf_filename)
  
      if File.exist?(pdf_path) == false
        
      else
        t.link("Show PDF", instance, action: :generate_pdf, method: :post)
      end
    end
  end

  form do |worker|
    text_field :user_id, label: 'User id', readonly: true    
    text_field :phone_number
    text_area :summary, label: 'Worker summary'
    select :language_ids, Language.all.map { |language| ["#{language.name}, #{language.level}", language.id] }, { label: "Languages" }, { multiple: true }
    select :education_ids, Education.all.map { |education| ["#{education.location}, #{education.degree}", education.id] }, { label: "Education" }, {multiple: true}
    select :technology_ids, Technology.all, { label: "Technologies" }, {multiple: true}
    collection_select(:experience_ids, Experience.all, :id, :title, {label: 'Work experiences'}, multiple: true)
    
    row do
      col { datetime_field :updated_at }
      col { datetime_field :created_at }
    end
  end


  controller do
    def show
      toolbar(:primary) do |t|        
        worker = Worker.find(params[:id])
        pdf_filename = "cv_#{worker.id}.pdf"
        pdf_path = Rails.root.join('public', 'pdfs', pdf_filename)
  
        action_text = File.exist?(pdf_path)? 'Show' : 'Generate'
        
        t.link("#{action_text} PDF", instance, action: :generate_pdf, method: :post, icon: "fa fa-check")
      end
    end
    
    def generate_pdf
      worker = Worker.find(params[:id])
      HtmlToPdfJob.perform_async(worker_id=worker.id)
      
      pdf_filename = "cv_#{worker_id}.pdf"
      pdf_path = Rails.root.join('public', 'pdfs', pdf_filename)
      show_cv(pdf_path, pdf_filename)
    end

    def show_cv(path, name)
      if File.exist?(path)
        send_file path, filename: name, type: 'application/pdf', disposition: 'inline'
      else
        redirect_to workers_admin_index_path
      end
    end
end

  routes do
    post :generate_pdf, on: :member
  end  
end
