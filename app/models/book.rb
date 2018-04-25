class Book < ApplicationRecord
  validates :opinion, length: {maximum: 200}
  
  belongs_to :user
end
