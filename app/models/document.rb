class Document < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true
  has_attached_file :document


  def self.search(search)
    where("document_file_name LIKE ?" , "%#{search}%")
    where("author LIKE ?", "%#{search}%")
    where("body LIKE ?", "%#{search}%")
    where("date_of_document LIKE ?", "%#{search}%")
  end
end
