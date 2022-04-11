class Notice < ApplicationRecord
  paginates_per 6
  has_one_attached :image
  
  validates :titulo, presence: true
  validates :cuerpo, presence: true
  validates :tipo, presence: true
  validates :fecha, presence: true

  validate :image_validator

  private
    def image_validator
      if image.attached?
        if !image.content_type.in?(%w(image/png image/jpeg))
            errors.add(:image, 'must be an image')
          end
      else
        errors.add(:image, 'Debe cargar una imagen')
      end
    end 

end