class Todo < ApplicationRecord
  #make sure field is not left blank
  validates :title, presence: true
  
end
