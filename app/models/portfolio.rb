class Portfolio < ApplicationRecord
  validates :name, :description, :language_id, :url_access, :birth_date, presence: true
  belongs_to :language

  has_attached_file :avatar, styles: { thumb: "100x100>" }, default_url: "/images/:style/sem-imagem.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/  
end
