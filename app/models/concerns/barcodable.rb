module Barcodable
  extend ActiveSupport::Concern

  included do
    before_create :generate_barcode

    has_attached_file :barcode_img

    validates_attachment_content_type :barcode_img, content_type: %w(image/png)
  end

  private

  def generate_barcode
    data = SecureRandom.random_number(10**12).to_s
    barcode = Barcodes.create('EAN13', {
      data: data,
      bar_width: 35,
      bar_height: 1500,
      caption_height: 300,
      caption_size: 275
    } )

    self.barcode = barcode.caption_data

    # Paperclip it
    tmpfile = Tempfile.new(%w(barcode .png))
    Barcodes::Renderer::Image.new(barcode).render(tmpfile.path)

    self.barcode_img = tmpfile

    tmpfile.close
    tmpfile.unlink
  end
end
