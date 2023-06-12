class HtmlToPdfJob
  include Sidekiq::Job

  def perform(worker_id)
    options = {
      page_size: 'A4',
      disable_smart_shrinking: true,
    }
  
    worker = Worker.find(worker_id)
    @worker = worker
  
    template_path = '/home/skxlpv/OWN/cvbuilder/app/views/shared/cv_template.html.erb'
    template_content = File.read(template_path)
    renderer = ERB.new(template_content)
    html = renderer.result(binding)
  
    pdfkit = PDFKit.new(html, options)
    pdf_data = pdfkit.to_pdf
  
    File.open("/home/skxlpv/OWN/cvbuilder/public/pdfs/cv_#{worker_id}.pdf", 'wb') do |file|
      file << pdf_data
    end
  end
  
end
