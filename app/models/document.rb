class Document < ApplicationRecord

  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true
  #validates_attachment :document, content_type: {content_type: "application/pdf"}
  # show the first part of the pdf in a thumbnail jpg
  has_attached_file :document, styles: {
      thumb: { geometry: "150x150", format: "jpg" },
      square: '200x200#',
      medium: '300x300>'
  }, processors: [:ghostscript]


  def self.search(search)
    where("document_file_name LIKE ?" , "%#{search}%")
    where("author LIKE ?", "%#{search}%")
    where("body LIKE ?", "%#{search}%")
    where("date_of_document LIKE ?", "%#{search}%")
  end

end
