class Document < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true
  has_attached_file :document, styles: {thumbnail: "60x60#"}
  validates_attachment :document, content_type: {content_type: "application/pdf"}
  validates_something_else


  def self.search(search)
    where("document_file_name LIKE ?" , "%#{search}%")
    where("author LIKE ?", "%#{search}%")
    where("body LIKE ?", "%#{search}%")
    where("date_of_document LIKE ?", "%#{search}%")
  end
end
