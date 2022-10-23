class Item < ApplicationRecord
    has_one_attached :image
    belongs_to :genre

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/image/no_image_1.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpeg', content_type: 'image/jpeg')
    end
      image
  end

  def add_tax_price
  (self.price * 1.10).round
  end
end
