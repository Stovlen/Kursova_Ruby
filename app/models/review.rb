class Review < ApplicationRecord
  belongs_to :product

  validates :name, presence: true
  validates :comment, presence: true, length: { minimum: 5 }
end
