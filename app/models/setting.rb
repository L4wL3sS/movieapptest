class Setting < ApplicationRecord
  belongs_to :user
  
  validates :country, :language, length: {minimum: 2}
end
