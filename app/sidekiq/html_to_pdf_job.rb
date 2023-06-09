class HtmlToPdfJob
  include Sidekiq::Job

  def perform(worker_id)
    options = {
        page_size: 'A4',
        disable_smart_shrinking: true,
      }

    worker = Worker.find(worker_id)

    html_template = File.read('/home/skxlpv/OWN/cvbuilder/app/views/shared/cv_template.html.erb')
    html = html_template.gsub('{worker_name}', worker.user.first_name)
    pdfkit = PDFKit.new(html, options)
    pdf_data = pdfkit.to_pdf
    
    File.open("/home/skxlpv/OWN/cvbuilder/public/pdfs/cv_#{worker.user.first_name}.pdf", 'wb') do |file|
      file << pdf_data
    end
  end
end
