class Article < ApplicationRecord
  #getters and setters will be given by rails, can be filled by console since table is already in schema
  validates :title, presence: true, length: {minimum: 3, maximum: 50} #ensure that there is a title before saving
  validates :description, presence: true, length: {minimum: 3, maximum: 50}
end
