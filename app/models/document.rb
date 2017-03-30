class Document < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true
  has_attached_file :document


  def self.search(search)
    where ("document_file_name ILIKE ? OR author ILIKE ? OR body ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
