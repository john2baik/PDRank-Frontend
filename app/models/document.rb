class Document < ApplicationRecord
  belongs_to :user
  default_scope -> {order(created_at: desc)} #in order of newest to
  validates :user_id, presence: true
  validates :content, presence: true
end
