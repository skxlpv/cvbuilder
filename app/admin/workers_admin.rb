class PdfController < ApplicationController
  def generate_pdf
    pdf = Prawn::Document.new

    pdf.text 'This is a Heading', size: 18, style: :bold, align: :center, margin_bottom: 10
    pdf.text 'This is a paragraph of text.', size: 12, align: :justify, margin_bottom: 20

    pdf.font('Helvetica') do
      pdf.text 'This is some text with a custom font.'
    end

    pdf.render_file('output.pdf')
  end
end

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
      PdfController.new.generate_pdf
    end
    
  end

  routes do
    post :generate_pdf, on: :member
  end  
end
